import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/ui/components/cupertino_list_tile.dart';
import 'package:catweb/ui/components/dialog.dart';
import 'package:catweb/ui/pages/rules_manager/rules_parser/rules_parser_editor.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';

class RulesParserManager extends StatelessWidget {
  const RulesParserManager({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: store.rulesModel.listViewParser.map((element) {
            return const ListTile();
          }).toList(),
        ),
        CupertinoListTile(
          title: const Text('添加'),
          leading: const Icon(Icons.add),
          onTap: () => addRulesParser(context),
        ),
      ],
    );
  }

  Future<void> addRulesParser(BuildContext context) async {
    final selection = await showCupertinoSelectDialog<ParserType>(
      context: context,
      title: '规则类型',
      cancelText: '取消',
      items: const [
        SelectTileItem(title: '列表解析器', value: ParserType.list),
        SelectTileItem(title: '详情解析器', value: ParserType.gallery),
      ],
    );
    if (selection != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RulesParserEditor(
                type: selection,
              )));
    }
  }
}
