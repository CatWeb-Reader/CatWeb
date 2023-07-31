import 'package:catweb/i18n.dart';
import 'package:flutter/cupertino.dart';

class SettingScaffold extends StatelessWidget {
  const SettingScaffold({
    super.key,
    this.fromSetting = true,
    this.title = '',
    required this.children,
  });

  final bool fromSetting;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        previousPageTitle: fromSetting ? I.of(context).setting : null,
      ),
      child: ListView(
        children: children,
      ),
    );
  }
}
