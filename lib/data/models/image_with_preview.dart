import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/result/base.dart';
import 'package:catweb/data/models/ffi/result/result.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_provider.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/widgets.dart';

import 'package:catweb/navigator.dart';
import 'package:catweb/data/loaders/load_more_mixin.dart';
import 'package:catweb/data/loaders/load_more_model.dart';

/// 带预览的图片，此model可用于列表与瀑布流
abstract class ImageWithPreviewModel<T>
    with LoadStateMixin
    implements LoadMoreItem<T> {
  ImageWithPreviewModel(this.previewModel);

  /// 预览图的数据, 初始状态下就能拿到
  T previewModel;

  ImageResult? get previewImage;

  /// 从初始
  String? get idCode;

  /// 大图的数据
  ValueNotifier<ImageReaderResult?> imageModel = ValueNotifier<ImageReaderResult?>(null);
  ValueNotifier<DioImageProvider?> imageProvider = ValueNotifier<DioImageProvider?>(null);

  /// 加载模型
  Future<void> loadReaderModel({
    required SitePage blueprint,
    required SiteEnvStore localEnv,
  }) async {
    try {
      if (imageModel.value != null || state.isLoading) return;
      loadStart();
      final url = blueprint.url.value.isEmpty ? idCode! : blueprint.url.value;
      final global = get<SiteService>();
      final env = localEnv.clone()..['idCode'] = idCode!;
      imageModel.value = await global.site.value!.client.getReadImage(
        url: url,
        model: blueprint,
        localEnv: env,
      );
      imageProvider.value = DioImageProvider(
        imageModel: imageModel.value!.image!,
        dio: global.site.value!.client.imageDio,
      );
      imageProvider.value?.resolve(const ImageConfiguration());
      loadComplete();
    } on Exception catch (e) {
      logger.e(e);
      loadError(e);
    }
  }
}
