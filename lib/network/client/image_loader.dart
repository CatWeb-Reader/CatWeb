import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/protocol/model/model.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart';

enum ImageLoadState {
  init,
  cached,
  waiting,
  loading,
  finish,
  error,
}

class ImageLoadModel {
  ImageLoadModel({
    required this.model,
    required this.dio,
  });

  final ImageRpcModel model;
  final Dio dio;

  final Rx<ImageLoadState> _state = ImageLoadState.waiting.obs;
  final RxDouble _progress = 0.0.obs;
  final RxInt _handleWidget = 1.obs;
  final Rx<Exception?> lastException = Rx(null);

  Uint8List? _data;

  Uint8List? get data => _data;

  double get progress => _progress.value;

  String get key => model.key;

  bool get needLoad =>
      (_state.value == ImageLoadState.waiting ||
          _state.value == ImageLoadState.init) &&
      _handleWidget.value > 0;

  ImageLoadState get state => _state.value;

  Future<void> loadCache() async {
    if (_state.value == ImageLoadState.cached ||
        _state.value == ImageLoadState.init) {
      final db = Get.find<SettingController>().dbCacheStore;
      final cache = await db.get(key);
      if (cache != null) {
        await load();
      } else {
        if (_state.value == ImageLoadState.init) {
          _state.value = ImageLoadState.waiting;
        }
      }
    }
  }

  Future<ImageLoadModel> load() async {
    try {
      _state.value = ImageLoadState.loading;
      final rsp = await dio.get<Uint8List>(
        model.url,
        onReceiveProgress: (r, t) => _progress.value = r / t,
        options: Get.find<SettingController>()
            .dioCacheOptions
            .copyWith(
              policy: CachePolicy.request,
              keyBuilder: (req) => key,
            )
            .toOptions()
            .copyWith(responseType: ResponseType.bytes),
      );
      if (rsp.data == null || rsp.data!.isEmpty) {
        throw StateError(
            '${model.url} is empty and cannot be loaded as an image.');
      }
      _data = rsp.data;
      _state.value = ImageLoadState.finish;
    } on Exception catch (e) {
      lastException.value = e;
      await _onDisplayError();
      rethrow;
    }
    return this;
  }

  void handle() => _handleWidget.value += 1;

  int get handleCount => _handleWidget.value;

  void dispose() {
    _handleWidget.value -= 1;
    if (_handleWidget.value == 0) {
      if (_state.value == ImageLoadState.finish) {
        _state.value = ImageLoadState.cached;
      } else {
        _state.value = ImageLoadState.waiting;
      }
      _progress.value = 0.0;
    }
  }

  Future<void> _onDisplayError() async {
    _state.value = ImageLoadState.error;
    _progress.value = 0.0;
    _data = null;
    Get.find<SettingController>().dbCacheStore.delete(key);
  }
}

class ImageConcurrency {
  ImageConcurrency({required this.dio, this.concurrency = 0});

  final Dio dio;
  final int concurrency;

  final _globalCancelToken = CancelToken();
  final _loadCompleteImages = <String, ImageLoadModel>{};
  final _waitLoadImages = <String, ImageLoadModel>{};
  final _loadingImages = <String, ImageLoadModel>{};

  List<ImageLoadModel> get activeImage =>
      _waitLoadImages.values.where((e) => e.needLoad).toList();

  ImageLoadModel create(ImageRpcModel model) {
    if (_loadCompleteImages.containsKey(model.key)) {
      final exist = _loadCompleteImages[model.key]!..handle();
      exist.loadCache().whenComplete(() => _trigger());
      return exist;
    }

    if (_waitLoadImages.containsKey(model.key)) {
      final exist = _waitLoadImages[model.key]!..handle();
      exist.loadCache().whenComplete(() => _trigger());
      return exist;
    }

    if (_loadingImages.containsKey(model.key)) {
      final exist = _loadingImages[model.key]!..handle();
      exist.loadCache().whenComplete(() => _trigger());
      return exist;
    }

    final loadModel = ImageLoadModel(model: model, dio: dio);
    _waitLoadImages[model.key] = loadModel;
    _trigger();
    return loadModel;
  }

  void dispose() {
    _globalCancelToken.cancel();
  }

  void _trigger() {
    while ((_loadingImages.length < concurrency || concurrency == 0) &&
        activeImage.isNotEmpty) {
      final item = activeImage[0];
      _waitLoadImages.remove(item.key);
      _loadingImages[item.key] = item;
      item.load().then((value) {
        _loadCompleteImages[item.key] = item;
      }).catchError((err) {
        _waitLoadImages[item.key] = item;
      }).then((value) {
        _loadingImages.remove(item.key);
        _trigger();
      });
    }
  }
}
