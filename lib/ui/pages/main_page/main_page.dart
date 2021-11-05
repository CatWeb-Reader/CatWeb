import 'package:catweb/ui/fragments/main_drawer/main_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const routeName = 'MainPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: const MainDrawer(),
      appBar: AppBar(),
      body: Column(),
    );
  }
}
