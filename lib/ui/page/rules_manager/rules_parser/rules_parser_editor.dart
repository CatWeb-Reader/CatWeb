import 'package:cat_web/ui/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'gallery_parser.dart';
import 'editor_store.dart';
import 'extra_parser.dart';

class RulesParserEditor extends StatelessWidget {
  RulesParserEditor({Key? key}) : super(key: key);

  static String routeName = 'rules_parser_editor';

  final store = EditorStore();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: '规则编辑',
          bottom: const TabBar(
            tabs: [
              Tab(text: '基础规则'),
              Tab(text: '附加字段'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildBody(context),
            buildExtra(),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return ColoredBox(
      color: const Color(0xfff1f1f6),
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          buildGalleryParser(context, store.parserBase),
        ],
      ),
    );
  }

  Widget buildExtra() {
    return Observer(
      builder: (context) {
        return ColoredBox(
          color: const Color(0xfff1f1f6),
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: [
              buildExtraParser(context, store.parserBase),
            ],
          ),
        );
      },
    );
  }
}
