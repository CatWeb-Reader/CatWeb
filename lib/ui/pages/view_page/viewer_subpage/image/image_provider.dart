import 'dart:async';
import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/gen/protobuf/model.pb.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class DioImageProvider extends ImageProvider<DioImageProvider> {
  DioImageProvider({
    required this.rpcModel,
    required this.dio,
    this.scale = 1.0,
  });

  final Dio dio;
  final ImageRpcModel rpcModel;
  final double scale;

  final _cancelToken = CancelToken().obs;

  @override
  ImageStreamCompleter loadBuffer(
      DioImageProvider key, DecoderBufferCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents =
        StreamController<ImageChunkEvent>();
    return MultiFrameImageStreamCompleter(
      chunkEvents: chunkEvents.stream,
      codec: _loadAsync(key, decode, chunkEvents),
      scale: key.scale,
      debugLabel: rpcModel.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<DioImageProvider>('Image key', key),
        ];
      },
    );
  }

  Future<ui.Codec> _loadAsync(
      DioImageProvider key,
      DecoderBufferCallback decode,
      StreamController<ImageChunkEvent> chunkEvents) async {
    final rsp = await dio.get<Uint8List>(
      rpcModel.url,
      cancelToken: _cancelToken.value,
      onReceiveProgress: (r, t) => chunkEvents.add(ImageChunkEvent(
        cumulativeBytesLoaded: r,
        expectedTotalBytes: t,
      )),
      options: Get.find<SettingService>()
          .imageCacheOption
          .toOptions()
          .copyWith(responseType: ResponseType.bytes),
    );
    if (rsp.data == null || rsp.data!.isEmpty) {
      throw StateError(
          '${rpcModel.url} is empty and cannot be loaded as an image.');
    }
    final buffer = await ui.ImmutableBuffer.fromUint8List(rsp.data!);
    return decode(buffer);
  }

  @override
  Future<DioImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<DioImageProvider>(this);
  }

  void cancel() => _cancelToken.value.cancel();
}
