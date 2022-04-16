import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/parser.pbenum.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_parser/rules_parser_editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum _MenuSelect {
  edit,
  delete,
}

class RulesParserManager extends GetView<RulesEditController> {
  const RulesParserManager({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.blueprint.parsers.map((e) {
                return CupertinoListTile(
                  title: Text(e.name.value),
                  subtitle: Text(e.displayType(context)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    minSize: 10,
                    child: const Icon(Icons.more_horiz_outlined),
                    onPressed: () => _onTrailingTap(context, e),
                  ),
                  onTap: () => _editRules(context, e),
                );
              }).toList(),
            )),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => _editRules(context),
        ),
      ],
    );
  }

  Future<void> _onTrailingTap(
    BuildContext context,
    ParserBaseModel model,
  ) async {
    final result = await showCupertinoSelectDialog<_MenuSelect>(
      cancelText: '取消',
      context: context,
      items: const [
        SelectTileItem(title: '编辑', value: _MenuSelect.edit),
        SelectTileItem(
          title: '删除',
          value: _MenuSelect.delete,
          destructive: true,
        ),
      ],
    );
    switch (result) {
      case null:
        break;
      case _MenuSelect.edit:
        await _editRules(context, model);
        break;
      case _MenuSelect.delete:
        _onParserDelete(context, model);
        break;
    }
  }

  void _onParserDelete(BuildContext context, ParserBaseModel model) {
    final using = controller.blueprint.pageList
        .where((p0) => p0.baseParser.value == model.uuid)
        .map((e) => e.name.value)
        .toList();
    if (using.isNotEmpty) {
      showCupertinoConfirmDialog(
          context: context,
          content: '无法删除, 因下列页面正在使用此解析器:\n ${using.join(' ')}');
    } else {
      showCupertinoConfirmDialog(
        context: context,
        content: '确定要删除 ${model.name} 吗？',
        confineText: I.of(context).delete,
        confineTextColor: CupertinoColors.systemRed.resolveFrom(context),
      ).then((value) {
        if (value == true) {
          controller.blueprint.removeParser(model);
        }
      });
    }
  }

  Future<ParserBaseModel?> _genParser(BuildContext context) async {
    final selection = await showCupertinoSelectDialog<ParserType>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '列表页', value: ParserType.PARSER_TYPE_LIST_VIEW),
        SelectTileItem(title: '详情页', value: ParserType.PARSER_TYPE_GALLERY),
        SelectTileItem(title: '图片页', value: ParserType.PARSER_TYPE_IMAGE),
        SelectTileItem(
            title: '补全页', value: ParserType.PARSER_TYPE_AUTO_COMPLETE),
      ],
    );
    if (selection != null) {
      switch (selection) {
        case ParserType.PARSER_TYPE_LIST_VIEW:
          return ListViewParserModel();
        case ParserType.PARSER_TYPE_GALLERY:
          return GalleryParserModel();
        case ParserType.PARSER_TYPE_IMAGE:
          return ImageReaderParserModel();
        case ParserType.PARSER_TYPE_AUTO_COMPLETE:
          return AutoCompleteParserModel();
      }
    }
    return null;
  }

  Future<void> _editRules(
    BuildContext context, [
    ParserBaseModel? model,
  ]) async {
    final input = model ?? await _genParser(context);
    if (input == null) return;
    await Get.to(() => RulesParserEditor(model: input));
    if (model == null) controller.blueprint.addParser(input);
  }
}
