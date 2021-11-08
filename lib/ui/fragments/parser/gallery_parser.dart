import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/form.dart';
import 'package:flutter/material.dart';

class GalleryParser extends StatelessWidget {
  const GalleryParser({
    Key? key,
    required this.model,
  }) : super(key: key);

  final GalleryParserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildCardList([
          buildInputForm(labelText: '名称', value: model.name),
        ], padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5)),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '标题',
            field: '#title',
            selectorModel: model.title,
          ),
          RulesForm(
            title: '副标题',
            field: '#subtitle',
            selectorModel: model.subTitle,
          ),
          RulesForm(
            title: '上传时间',
            field: '#uploadTime',
            selectorModel: model.uploadTIme,
          ),
          RulesForm(
            title: '评分',
            field: '#star',
            selectorModel: model.star,
          ),
          RulesForm(
            title: '语言',
            field: '#language',
            selectorModel: model.language,
          ),
          RulesForm(
            title: '收藏次数',
            field: '#favoriteCount',
            selectorModel: model.favoriteCount,
          ),
          RulesForm(
            title: '描述',
            field: '#description',
            selectorModel: model.description,
          ),
          RulesForm(
            title: '总图片数',
            field: '#imgCount',
            selectorModel: model.imgCount,
          ),
          RulesForm(
            title: '每面图片数',
            field: '#pageImageCount',
            selectorModel: model.prePageImg,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '封面地址',
            field: '#previewUrl',
            selectorModel: model.coverImg.imgUrl,
          ),
          RulesForm(
            title: '封面宽度',
            field: '#previewWidth',
            selectorModel: model.coverImg.imgWidth,
          ),
          RulesForm(
            title: '封面高度',
            field: '#previewHeight',
            selectorModel: model.coverImg.imgHeight,
          ),
          RulesForm(
            title: '封面X偏移',
            field: '#previewX',
            selectorModel: model.coverImg.imgX,
          ),
          RulesForm(
            title: '封面Y偏移',
            field: '#previewY',
            selectorModel: model.coverImg.imgY,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '缩略图选择器', value: model.thumbnailSelector),
          RulesForm(
            title: '缩略图地址',
            field: '#thumbnailUrl',
            selectorModel: model.thumbnail.imgUrl,
          ),
          RulesForm(
            title: '缩略图宽度',
            field: '#thumbnailWidth',
            selectorModel: model.thumbnail.imgWidth,
          ),
          RulesForm(
            title: '缩略图高度',
            field: '#thumbnailHeight',
            selectorModel: model.thumbnail.imgHeight,
          ),
          RulesForm(
            title: '缩略图X偏移',
            field: '#thumbnailX',
            selectorModel: model.thumbnail.imgX,
          ),
          RulesForm(
            title: '缩略图Y偏移',
            field: '#thumbnailY',
            selectorModel: model.thumbnail.imgY,
          ),
          RulesForm(
            title: '缩略图目标',
            field: '#thumbnailTarget',
            selectorModel: model.thumbnailUrl,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '分类',
            field: '#tag',
            selectorModel: model.tag,
          ),
          RulesForm(
            title: '分类颜色',
            field: '#tagColor',
            selectorModel: model.tagColor,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '评论选择器', value: model.commentSelector),
          RulesForm(
            title: '评论内容',
            field: '#comment',
            selectorModel: model.comments.content,
          ),
          RulesForm(
            title: '用户名',
            field: '#commentUsername',
            selectorModel: model.comments.username,
          ),
          RulesForm(
            title: '评论时间',
            field: '#commentPostTime',
            selectorModel: model.comments.postTime,
          ),
          RulesForm(
            title: '评论评分',
            field: '#commentVote',
            selectorModel: model.comments.vote,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          buildInputForm(labelText: '徽章选择器', value: model.badgeSelector),
          RulesForm(
            title: '徽章内容',
            field: '#badgeText',
            selectorModel: model.badgeText,
          ),
          RulesForm(
            title: '徽章颜色',
            field: '#badgeColor',
            selectorModel: model.badgeColor,
          ),
          RulesForm(
            title: '徽章类型',
            field: '#badgeType',
            selectorModel: model.badgeType,
          ),
        ]),
        const SizedBox(height: 5),
        buildCardList([
          RulesForm(
            title: '下一面地址',
            field: '#nextPage',
            selectorModel: model.nextPage,
          ),
        ]),
      ],
    );
  }
}
