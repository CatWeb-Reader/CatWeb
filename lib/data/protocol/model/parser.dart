import 'package:cat_web/data/protocol/model/selector.dart';
import 'package:cat_web/gen/protobuf/parser.pbserver.dart';
import 'package:cat_web/gen/protobuf/selector.pbserver.dart';
import 'package:get/get.dart';

abstract class ParserBaseModel {
  ParserBaseModel(Iterable<ExtraSelector>? pb)
      : extraSelectorModel =
            pb?.map((e) => ExtraSelectorModel(e)).toList().obs ??
                <ExtraSelectorModel>[].obs;

  // 额外信息
  final RxList<ExtraSelectorModel> extraSelectorModel;
}

class GalleryParserModel extends ParserBaseModel {
  GalleryParserModel([GalleryParser? pb])
      : name = pb?.name.obs ?? ''.obs,
        title = SelectorModel(pb?.title),
        subTitle = SelectorModel(pb?.subtitle),
        uploadTIme = SelectorModel(pb?.uploadTIme),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        prePageImg = SelectorModel(pb?.prePageImg, true),
        favoriteCount = SelectorModel(pb?.favoriteCount),
        language = SelectorModel(pb?.language),
        coverImg = ImageSelectorModel(pb?.coverImg),
        description = SelectorModel(pb?.description),
        thumbnailSelector = pb?.thumbnailSelector.obs ?? ''.obs,
        thumbnail = ImageSelectorModel(pb?.thumbnail),
        thumbnailUrl = SelectorModel(pb?.thumbnailUrl),
        commentSelector = pb?.commentSelector.obs ?? ''.obs,
        comments = CommentSelectorModel(pb?.comments),
        tag = SelectorModel(pb?.tag),
        tagColor = SelectorModel(pb?.tagColor),
        badgeSelector = pb?.badgeSelector.obs ?? ''.obs,
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        badgeType = SelectorModel(pb?.badgeType),
        super(pb?.extraSelector);

  final RxString name;

  final SelectorModel title;
  final SelectorModel subTitle;
  final SelectorModel uploadTIme;
  final SelectorModel star;
  final SelectorModel imgCount;
  final SelectorModel prePageImg;
  final SelectorModel favoriteCount;
  final SelectorModel language;
  final ImageSelectorModel coverImg;
  final SelectorModel description;

  final RxString thumbnailSelector;
  final ImageSelectorModel thumbnail;
  final SelectorModel thumbnailUrl;

  final RxString commentSelector;
  final CommentSelectorModel comments;

  final SelectorModel tag;
  final SelectorModel tagColor;

  final RxString badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeColor;
  final SelectorModel badgeType;

  GalleryParser toPb() => GalleryParser(
        name: name.value,
        title: title.toPb(),
        subtitle: subTitle.toPb(),
        uploadTIme: uploadTIme.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        prePageImg: prePageImg.toPb(),
        favoriteCount: favoriteCount.toPb(),
        language: language.toPb(),
        coverImg: coverImg.toPb(),
        description: description.toPb(),
        thumbnailSelector: thumbnailSelector.value,
        thumbnail: thumbnail.toPb(),
        thumbnailUrl: thumbnailUrl.toPb(),
        commentSelector: commentSelector.value,
        comments: comments.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeSelector: badgeSelector.value,
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        badgeType: badgeType.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
      );
}

class ListViewParserModel extends ParserBaseModel {
  ListViewParserModel([ListViewParser? pb])
      : name = pb?.name.obs ?? ''.obs,
        itemSelector = pb?.itemSelector.obs ?? ''.obs,
        title = SelectorModel(pb?.title),
        subtitle = SelectorModel(pb?.subtitle),
        uploadTIme = SelectorModel(pb?.uploadTIme),
        star = SelectorModel(pb?.star, true),
        imgCount = SelectorModel(pb?.imgCount, true),
        previewImg = ImageSelectorModel(pb?.previewImg),
        tag = SelectorModel(pb?.imgCount),
        tagColor = SelectorModel(pb?.imgCount),
        badgeSelector = pb?.badgeSelector.obs ?? ''.obs,
        badgeText = SelectorModel(pb?.badgeText),
        badgeColor = SelectorModel(pb?.badgeColor),
        super(pb?.extraSelector);

  final RxString name;

  // 列表选择器
  final RxString itemSelector;

  // 基础信息
  final SelectorModel title;
  final SelectorModel subtitle;
  final SelectorModel uploadTIme;
  final SelectorModel star;
  final SelectorModel imgCount;

  // 预览图片
  final ImageSelectorModel previewImg;

  // 大Tag
  final SelectorModel tag;
  final SelectorModel tagColor;

  // 小徽章
  final RxString badgeSelector;
  final SelectorModel badgeText;
  final SelectorModel badgeColor;

  ListViewParser toPb() => ListViewParser(
        name: name.value,
        itemSelector: itemSelector.value,
        title: title.toPb(),
        subtitle: subtitle.toPb(),
        uploadTIme: uploadTIme.toPb(),
        star: star.toPb(),
        imgCount: imgCount.toPb(),
        previewImg: previewImg.toPb(),
        tag: tag.toPb(),
        tagColor: tagColor.toPb(),
        badgeSelector: badgeSelector.value,
        badgeText: badgeText.toPb(),
        badgeColor: badgeColor.toPb(),
        extraSelector: extraSelectorModel.map((e) => e.toPb()),
      );
}
