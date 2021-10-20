import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/ui/components/rules_card.dart';
import 'package:cat_web/ui/page/rules_manager/rules_parser/rules_form.dart';
import 'package:flutter/material.dart';

Widget buildInputForm({required String labelText}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: labelText,
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

Widget buildCardList(List<Widget> children) {
  return Card(
    child: Column(mainAxisSize: MainAxisSize.min, children: children),
  );
}

Widget buildListParser(BuildContext context, ListViewParserModel model) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RulesCard(title: '基础设置', children: [
        buildInputForm(labelText: '解析器名称'),
        buildInputForm(labelText: '项目选择器'),
      ]),
      const SizedBox(height: 5),
      buildCardList([
        RulesForm(
          title: '标题',
          selectorModel: model.title,
        ),
        const Divider(),
        RulesForm(
          title: '上传者',
          selectorModel: model.subtitle,
        ),
        const Divider(),
        RulesForm(
          title: '上传时间',
          selectorModel: model.uploadTIme,
        ),
        const Divider(),
        RulesForm(
          title: '评分',
          selectorModel: model.star,
        ),
      ]),
      const SizedBox(height: 5),
      buildCardList([
        RulesForm(
          title: '封面',
          selectorModel: model.previewImg.imgUrl,
        ),
        const Divider(),
        RulesForm(
          title: '封面宽度',
          selectorModel: model.previewImg.imgWidth,
        ),
        const Divider(),
        RulesForm(
          title: '封面高度',
          selectorModel: model.previewImg.imgHeight,
        ),
        const Divider(),
        RulesForm(
          title: '封面X偏移',
          selectorModel: model.previewImg.imgX,
        ),
        const Divider(),
        RulesForm(
          title: '封面Y偏移',
          selectorModel: model.previewImg.imgY,
        ),
      ]),
      const SizedBox(height: 5),
      buildCardList([
        RulesForm(
          title: '分类',
          selectorModel: model.tag,
        ),
        const Divider(),
        RulesForm(
          title: '分类颜色',
          selectorModel: model.tagColor,
        ),
      ]),
      const SizedBox(height: 5),
      buildCardList([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: buildInputForm(labelText: '徽章选择器'),
        ),
        RulesForm(
          title: '徽章内容',
          selectorModel: model.badgeText,
        ),
        const Divider(),
        RulesForm(
          title: '徽章颜色',
          selectorModel: model.badgeColor,
        ),
      ]),
    ],
  );
}
