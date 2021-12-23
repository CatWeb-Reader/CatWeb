import 'dart:typed_data';

import 'package:catweb/data/controller/setting_controller.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'dark_image.dart';

typedef ImageWidgetBuilder = Widget Function(
  BuildContext context,
  Uint8List imgData,
);

class DioImageParams {
  const DioImageParams({
    required this.url,
    this.cacheKey,
  });

  final String url;
  final String? cacheKey;
}

typedef AsyncBuilder = Future<DioImageParams> Function();

typedef LoadingWidgetBuilder = Widget Function(
  BuildContext context,
  ImageChunkEvent chunkEvent,
);

typedef ErrorBuilder = Widget Function(
  BuildContext context,
  Object? err,
  Function reload,
);

class DioImage extends StatefulWidget {
  const DioImage({
    Key? key,
    required this.dio,
    this.url,
    this.duration,
    this.imageBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.cacheKey,
    this.builder,
  })  : assert(url != null || builder != null),
        super(key: key);

  final Dio dio;
  final String? url;
  final AsyncBuilder? builder;

  final Duration? duration;

  final ImageWidgetBuilder? imageBuilder;
  final LoadingWidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final String? cacheKey;

  @override
  _DioImageState createState() => _DioImageState();
}

enum LoadingType {
  done,
  loading,
  error,
}

class _DioImageState extends State<DioImage> {
  late final ErrorBuilder errorBuilder = widget.errorBuilder ??
      (context, err, reload) {
        return InkWell(
          onTap: () {
            reload();
          },
          child: const Center(
            child: Icon(Icons.info),
          ),
        );
      };

  late final LoadingWidgetBuilder loadingBuilder = widget.loadingBuilder ??
      (context, chunkEvent) {
        return Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              value: (chunkEvent.expectedTotalBytes == null ||
                      chunkEvent.expectedTotalBytes == 0)
                  ? 0
                  : chunkEvent.cumulativeBytesLoaded /
                      chunkEvent.expectedTotalBytes!,
              strokeWidth: 2.5,
            ),
          ),
        );
      };

  late final ImageWidgetBuilder imageBuilder = widget.imageBuilder ??
      (context, imgData) => DarkImage(
            image: MemoryImage(imgData),
            fit: BoxFit.fill,
          );

  late final Dio dio = widget.dio;
  var _loadingType = LoadingType.loading;

  var chunkEvent =
      const ImageChunkEvent(expectedTotalBytes: 0, cumulativeBytesLoaded: 0);
  final cancelToken = CancelToken();

  Uint8List? imageData;
  Object? err;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _loadingType = LoadingType.loading;
      chunkEvent = const ImageChunkEvent(
          expectedTotalBytes: null, cumulativeBytesLoaded: 0);
    });
    try {
      String? imgUrl;
      String? cacheKey;

      if (widget.builder != null) {
        final model = await widget.builder!();
        imgUrl = model.url;
        cacheKey = model.cacheKey;
      }

      final key = cacheKey ??
          const Uuid().v5(Uuid.NAMESPACE_URL, imgUrl ?? widget.url!);

      final rsp = await dio.get<List<int>>(imgUrl ?? widget.url!,
          cancelToken: cancelToken,
          options: Get.find<SettingController>()
              .dioCacheOptions
              .copyWith(
                policy: CachePolicy.request,
                keyBuilder: (req) => key,
              )
              .toOptions()
              .copyWith(responseType: ResponseType.bytes),
          onReceiveProgress: (received, total) {
        if (mounted) {
          setState(() {
            chunkEvent = ImageChunkEvent(
              expectedTotalBytes: total,
              cumulativeBytesLoaded: received,
            );
          });
        }
      });
      if (mounted) {
        setState(() {
          imageData = Uint8List.fromList(rsp.data!);
          _loadingType = LoadingType.done;
        });
      }
    } on DioError catch (e) {
      if (mounted && !CancelToken.isCancel(e)) {
        setState(() {
          _loadingType = LoadingType.error;
          err = e;
        });
      }
      rethrow;
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadingType = LoadingType.error;
          err = e;
        });
      }
      rethrow;
    }
  }

  Widget buildBody(BuildContext context) {
    if (_loadingType == LoadingType.done) {
      return InkWell(
        child: imageBuilder(context, imageData!),
      );
    } else if (_loadingType == LoadingType.loading) {
      return loadingBuilder(context, chunkEvent);
    } else {
      return errorBuilder(context, err, fetchData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedSwitcher(
        duration: widget.duration ?? const Duration(milliseconds: 500),
        child: buildBody(context),
      ),
    );
  }
}
