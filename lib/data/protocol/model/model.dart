import 'dart:ui';

import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:uuid/uuid.dart';

extension GetDetail on GalleryRpcModel {
  String? getTitle() => hasTitle() ? title : null;

  String? getSubTitle() => hasSubtitle() ? subtitle : null;

  String? getLanguage() => hasLanguage() ? language : null;

  int? getImageCount() => hasImageCount() ? imageCount : null;

  String? getUploadTime() => hasUploadTime() ? uploadTime : null;

  int? getCountPrePage() => hasCountPrePage() ? countPrePage : null;

  String? getDescription() => hasDescription() ? description : null;

  double? getStar() => hasStar() ? star : null;

  ImageRpcModel? getCoverImg() => hasCoverImg() ? coverImg : ImageRpcModel();

  TagRpcModel? getTag() => hasTag() ? tag : TagRpcModel();
}

extension GetImageRpcModel on ImageRpcModel {
  String? getUrl() => hasUrl() ? url : null;

  String? getCacheKey() => hasCacheKey() ? cacheKey : null;

  double? getWidth() => hasWidth() ? width : null;

  double? getHeight() => hasHeight() ? height : null;

  double? getImgX() => hasImgX() ? imgX : null;

  double? getImgY() => hasImgY() ? imgY : null;

  String? getTarget() => hasTarget() ? target : null;

  String get key => getCacheKey() ?? const Uuid().v5(Uuid.NAMESPACE_URL, url);

  bool repeatImage() => hasImgX() && hasImgY();
}

extension GetTagRpcModel on TagRpcModel {
  String? getText() => hasText() ? text : null;

  Color? getColor() => hasColor() ? color.color : null;
}
