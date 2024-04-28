import 'dart:typed_data';
import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/network/client/image_concurrency.dart';
import 'package:catweb/network/client/image_loader.dart';
import 'package:catweb/ui/widgets/dark_image.dart';
import 'package:catweb/utils/debug.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

typedef ImageWidgetBuilder = Widget Function(
    BuildContext context, Uint8List imgData);

typedef LoadingWidgetBuilder = Widget Function(
    BuildContext context, double progress);

typedef ErrorBuilder = Widget Function(
    BuildContext context, Object? err, VoidCallback reload);

typedef WidgetBuilder = Widget Function(BuildContext context, Widget child);

class ImageLoader extends StatefulWidget {
  const ImageLoader({
    super.key,
    required this.concurrency,
    required this.model,
    this.imageBuilder,
    this.errorBuilder,
    this.hasSize = false,
    this.loadingWidgetBuilder,
    this.imageWidgetBuilder,
    this.innerImageBuilder,
    this.enableHero = true,
  });

  final ImageLoaderQueue concurrency;
  final ImageResult model;
  final ImageWidgetBuilder? imageBuilder;
  final ErrorBuilder? errorBuilder;
  final bool hasSize;
  final bool enableHero;

  final WidgetBuilder? loadingWidgetBuilder;
  final WidgetBuilder? imageWidgetBuilder;
  final WidgetBuilder? innerImageBuilder;

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  late final ImageLoadNotifier _imageLoadNotifier;
  late final ErrorBuilder errorBuilder;
  late final LoadingWidgetBuilder loadingBuilder;
  late final ImageWidgetBuilder imageBuilder;
  late final WidgetBuilder loadingWidgetBuilder;
  late final WidgetBuilder imageWidgetBuilder;
  late final WidgetBuilder innerImageBuilder;

  @override
  void initState() {
    imageBuilder = widget.imageBuilder ?? _defaultImageBuilder;
    errorBuilder = widget.errorBuilder ?? _defaultErrorBuilder;
    _imageLoadNotifier = widget.concurrency.create(widget.model);
    loadingWidgetBuilder = widget.loadingWidgetBuilder ?? _defaultWidgetBuilder;
    imageWidgetBuilder = widget.imageWidgetBuilder ?? _defaultWidgetBuilder;
    innerImageBuilder = widget.innerImageBuilder ?? _defaultWidgetBuilder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_imageLoadNotifier.value) {
      case AsyncProgressValue.idle:
        return loadingWidgetBuilder(context, loadingBuilder(context, 0));
      case AsyncProgressLoading(:final progress):
        return loadingWidgetBuilder(context, loadingBuilder(context, progress));
      case AsyncProgressError(:final error):
        return errorBuilder(context, error, _onReload);
      case AsyncProgressData(:final value):
        return imageWidgetBuilder(context, imageBuilder(context, value));
    }
    throw UnimplementedError();
  }

  void _onReload() {
    _imageLoadNotifier.free();
    widget.concurrency.trigger();
  }

  @override
  void dispose() {
    _imageLoadNotifier.handleUnMounted();
    super.dispose();
  }

  Widget _defaultWidgetBuilder(BuildContext context, Widget widget) => widget;

  Widget _defaultImageBuilder(BuildContext context, Uint8List imgData) {
    late Widget child;

    if (model.width != null && model.height != null) {
      child = ExtendedImage(
        width: model.width,
        height: model.height,
        image: MemoryImage(imgData),
        loadStateChanged: (state) {
          if (state.extendedImageLoadState != LoadState.completed) {
            return null;
          }
          final img = ExtendedRawImage(
            image: state.extendedImageInfo?.image,
            width: model.width,
            height: model.height,
            fit: BoxFit.fill,
            sourceRect: Rect.fromLTWH(
              model.x ?? 0,
              model.y ?? 0,
              model.width!,
              model.height!,
            ),
            scale: 0.2,
          );

          if (model.width != null && model.height != null) {
            return AspectRatio(
              aspectRatio: model.width! / model.height!,
              child: FittedBox(
                fit: BoxFit.contain,
                child: innerImageBuilder(context, img),
              ),
            );
          }
          return innerImageBuilder(context, img);
        },
      );
    } else {
      child = Center(
        child: innerImageBuilder(context, Image.memory(imgData)),
      );
    }

    return widget.enableHero
        ? Hero(
            tag: widget.model.cacheKey ?? widget.model.url!,
            child: DarkWidget(
              child: child,
            ),
          )
        : DarkWidget(
            child: child,
          );
  }

  Widget _defaultErrorBuilder(
    BuildContext context,
    Object? err,
    VoidCallback reload,
  ) {
    if (err is DioException) {
      logger.e(
          '图片网路错误: \n url: <${err.requestOptions.path}>\n path: <${err.requestOptions.path}>');
    } else {
      logger.e('图片加载错误', err);
    }

    return GestureDetector(
      onTap: () => reload(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.info),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5, top: 5),
            child: Text(
              err?.toString() ?? '',
              maxLines: 5,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageResult get model => widget.model;
}
