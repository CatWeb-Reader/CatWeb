import 'package:catweb/data/loaders/async_progress_value.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/image_with_preview.dart';
import 'package:catweb/ui/widgets/cupertino_progress_bar.dart';
import 'package:catweb/utils/helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';

import 'controller/reader_load_notifier.dart';

typedef ChildWidgetBuilder = Widget Function(
    BuildContext context, Widget child);

Widget _defaultChildBuilder(BuildContext context, Widget child) {
  return child;
}

class ImageViewerNew extends StatelessWidget {
  ImageViewerNew({
    super.key,
    required this.index,
    required this.imageWithPreviewModel,
    ChildWidgetBuilder? imageWrapBuilder,
  }) : imageWrapBuilder = imageWrapBuilder ?? _defaultChildBuilder;

  final int index;
  final ImageWithPreviewModel? imageWithPreviewModel;
  final ChildWidgetBuilder imageWrapBuilder;

  @override
  Widget build(BuildContext context) {
    if (imageWithPreviewModel == null) {
      return _buildInfProgressBar(context);
    }
    return AnimatedBuilder(
      animation: imageWithPreviewModel!,
      builder: (context, child) {
        switch (imageWithPreviewModel!.imageModel) {
          case AsyncProgressValue.idle:
          case AsyncProgressValue.loading:
            return _buildInfProgressBar(context);
          case AsyncProgressError(:final error, :final stackTrace):
            return _buildError(context, error, stackTrace);
          case AsyncProgressData(:final value):
            return _defaultImageBuilder(context, value?.image);
        }
      },
    );
  }

  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIndexText(),
        const SizedBox(height: 50),
        Text(
          '貌似出了点问题: ${error.toString()}',
          maxLines: 10,
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ],
    );
  }

  Widget _defaultImageBuilder(BuildContext context, ImageResult model) {
    if (model.x != null &&
        model.y != null &&
        model.width != null &&
        model.height != null) {
      return ExtendedImage(
        width: model.width,
        height: model.height,
        image: imageProvider,
        enableLoadState: true,
        handleLoadingProgress: true,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.completed) {
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
              // scale: 0.2,
            );

            if (model.width != null && model.height != null) {
              return AspectRatio(
                aspectRatio: model.width! / model.height!,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: imageWrapBuilder(context, img),
                ),
              );
            }
            return imageWrapBuilder(context, img);
          } else {
            return _buildCommonState(state);
          }
        },
      );
    }

    return ExtendedImage(
      image: imageProvider,
      enableLoadState: true,
      handleLoadingProgress: true,
      loadStateChanged: (state) {
        return _buildCommonState(state) ??
            imageWrapBuilder(context, state.completedWidget);
      },
    );
  }

  Widget? _buildCommonState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        final progress = state.loadingProgress?.expectedTotalBytes != null
            ? state.loadingProgress!.cumulativeBytesLoaded /
                state.loadingProgress!.expectedTotalBytes!
            : 0.0;
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          CupertinoProgress(
            progress: progress,
          ),
        ]);
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          Text(
            '貌似出了点问题: ${state.lastException?.toString()}',
            maxLines: 10,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ]);
    }
  }

  Widget _buildInfProgressBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIndexText(),
        const SizedBox(height: 50),
        const CupertinoInfProgress(),
      ],
    );
  }

  Widget _buildIndexText() {
    return Text(
      '${index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAspRation(BuildContext context, Widget child) {
    if (imageWithPreviewModel?.previewImage?.width != null &&
        imageWithPreviewModel?.previewImage?.height != null) {
      return AspectRatio(
        aspectRatio: imageWithPreviewModel!.previewImage!.width! /
            imageWithPreviewModel!.previewImage!.height!,
        child: child,
      );
    }
    return child;
  }

  Widget? _buildCommonState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        final progress = state.loadingProgress?.expectedTotalBytes != null
            ? state.loadingProgress!.cumulativeBytesLoaded /
                state.loadingProgress!.expectedTotalBytes!
            : 0.0;
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          CupertinoProgress(
            progress: progress,
          ),
        ]);
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          Text(
            '貌似出了点问题: ${state.lastException?.toString()}',
            maxLines: 10,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ]);
    }
  }

  Widget _buildCenterColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.readerInfo,
    this.imageWrapBuilder,
    required this.index,
  });

  final ReaderInfo readerInfo;
  final int index;

  final Widget Function(BuildContext context, Widget child)? imageWrapBuilder;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  ImageWithPreviewModel? get model =>
      widget.readerInfo.items.toList().index(widget.index);

  late final _imageWrapBuilder =
      widget.imageWrapBuilder ?? (BuildContext context, Widget child) => child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildImage(context));
  }

  Widget _buildAspRation(BuildContext context, Widget child) {
    if (model?.previewImage?.width != null &&
        model?.previewImage?.height != null) {
      return AspectRatio(
        aspectRatio: model!.previewImage!.width! / model!.previewImage!.height!,
        child: child,
      );
    }
    return child;
  }

  Widget _buildImage(BuildContext context) {
    // 还没有加载完图片数据
    if (model == null || model!.imageModel.value == null) {
      return _buildAspRation(
          context,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIndexText(),
              const SizedBox(height: 50),
              const CupertinoInfProgress(),
            ],
          ));
    }
    return _buildAspRation(
        context,
        _defaultImageBuilder(
          context,
          model!.imageProvider.value!,
          model!.imageModel.value!.image!,
        ));
  }

  Widget _defaultImageBuilder(
    BuildContext context,
    DioImageProvider imageProvider,
    ImageResult model,
  ) {
    late Widget child;
    if (model.x != null &&
        model.y != null &&
        model.width != null &&
        model.height != null) {
      child = ExtendedImage(
        width: model.width,
        height: model.height,
        image: imageProvider,
        enableLoadState: true,
        handleLoadingProgress: true,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.completed) {
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
              // scale: 0.2,
            );

            if (model.width != null && model.height != null) {
              return AspectRatio(
                aspectRatio: model.width! / model.height!,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: _imageWrapBuilder(context, img),
                ),
              );
            }
            return _imageWrapBuilder(context, img);
          } else {
            return _buildCommonState(state);
          }
        },
      );
    } else {
      child = ExtendedImage(
        image: imageProvider,
        enableLoadState: true,
        handleLoadingProgress: true,
        loadStateChanged: (state) {
          return _buildCommonState(state) ??
              _imageWrapBuilder(context, state.completedWidget);
        },
      );
    }

    return child;
  }

  Widget? _buildCommonState(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        final progress = state.loadingProgress?.expectedTotalBytes != null
            ? state.loadingProgress!.cumulativeBytesLoaded /
                state.loadingProgress!.expectedTotalBytes!
            : 0.0;
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          CupertinoProgress(
            progress: progress,
          ),
        ]);
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return _buildCenterColumn([
          _buildIndexText(),
          const SizedBox(height: 50),
          Text(
            '貌似出了点问题: ${state.lastException?.toString()}',
            maxLines: 10,
            style: const TextStyle(color: CupertinoColors.white),
          ),
        ]);
    }
  }

  Widget _buildCenterColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildIndexText() {
    return Text(
      '${widget.index + 1}',
      style: const TextStyle(
        color: CupertinoColors.white,
        fontSize: 60,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
