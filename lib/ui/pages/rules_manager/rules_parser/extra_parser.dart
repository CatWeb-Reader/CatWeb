import 'package:cat_web/data/protocol/model/parser.dart';
import 'package:cat_web/data/protocol/model/selector.dart';
import 'package:cat_web/ui/components/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraParser extends StatelessWidget {
  const ExtraParser({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ParserBaseModel model;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...model.extraSelectorModel.map((model) {
            return buildCardList([
              RulesForm(
                extraSelectorModel: model,
                selectorModel: model.selector,
              ),
            ]);
          }),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('添加'),
            onTap: () {
              model.extraSelectorModel.add(ExtraSelectorModel());
            },
          ),
        ],
      );
    });
  }
}


