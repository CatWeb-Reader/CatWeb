import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingSelectionTile<T> extends StatelessWidget {
  const SettingSelectionTile({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    this.useDialog = false,
    this.previousPageTitle,
  });

  static SettingSelectionTile<int> number({
    required String title,
    required RxInt value,
    required List<int> items,
    bool useDialog = false,
    String? previousPageTitle,
  }) =>
      SettingSelectionTile<int>(
        title: title,
        value: value,
        useDialog: useDialog,
        items: items.map((e) => SelectTileItem(title: e.toString(), value: e)),
        previousPageTitle: previousPageTitle,
      );

  final String title;
  final Iterable<SelectTileItem<T>> items;
  final Rx<T> value;
  final String? previousPageTitle;
  final bool useDialog;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SettingTile(
          title: title,
          trailingText: items.get((e) => e.value == value.value)?.title,
          onTap: () => _onTap(context),
        ));
  }

  Future<void> _onTap(BuildContext context) async {
    if (useDialog) {
      final result = await showCupertinoSelectDialog<T>(
        context: context,
        items: items,
      );
      if (result != null) {
        value.value = result;
      }
    } else {
      final result =
          await Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => _SettingSelectionPage(
                    title: title,
                    value: value,
                    items: items,
                    previousPageTitle: previousPageTitle,
                  )));
      if (result != null) {
        value.value = result;
      }
    }
  }
}

class _SettingSelectionPage<T> extends StatelessWidget {
  const _SettingSelectionPage({
    super.key,
    required this.title,
    required this.items,
    required this.value,
    this.previousPageTitle,
  });

  final String title;
  final Iterable<SelectTileItem<T>> items;
  final Rx<T> value;
  final String? previousPageTitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor:
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        middle: Text(title),
        border: null,
        previousPageTitle: previousPageTitle,
      ),
      child: ListView(
        children: [
          const SizedBox(height: 16),
          SettingGroupWidget(children: [
            for (var i = 0; i < items.length * 2; i++)
              if (i % 2 == 0)
                SettingTile(
                  title: items.elementAt(i ~/ 2).title,
                  trailing: Obx(() => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child: items.elementAt(i ~/ 2).value == value.value
                          ? const Icon(
                              CupertinoIcons.checkmark,
                              size: 18,
                            )
                          : const SizedBox())),
                  onTap: () => value.value = items.elementAt(i ~/ 2).value,
                )
              else
                const SettingDivider(),
          ]),
        ],
      ),
    );
  }
}
