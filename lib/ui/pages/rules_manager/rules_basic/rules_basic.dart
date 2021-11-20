import 'package:catweb/ui/components/cupertino_input.dart';
import 'package:catweb/ui/pages/rules_manager/rules_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RulesBasic extends StatelessWidget {
  const RulesBasic({
    Key? key,
    required this.store,
  }) : super(key: key);

  final RulesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: '名称',
            value: store.rulesModel.name,
          ),
          CupertinoInput(
            labelText: '基础Url',
            value: store.rulesModel.baseUrl,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(),
          ),
          CupertinoInput(
            labelText: '登录Url',
            value: store.rulesModel.loginUrl,
          ),
          CupertinoInput(
            labelText: '登录Cookie作用域',
            value: store.rulesModel.loginCookieReg,
            hintText: '.*',
          ),
          CupertinoInput(
            labelText: 'Cookies',
            value: store.rulesModel.extraCookies,
            minLine: 3,
          ),
        ],
      );
    });
  }
}
