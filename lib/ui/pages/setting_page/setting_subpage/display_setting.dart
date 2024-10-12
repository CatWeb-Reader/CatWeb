import 'package:catweb/data/controller/settings.dart';

import 'package:catweb/i18n.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/ui/widgets/cupertino_vn_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/widgets/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_base.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_selection.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:flutter/cupertino.dart';

class DisplaySettingPage extends StatelessWidget {
  const DisplaySettingPage({
    super.key,
    this.fromSetting = true,
  });

  final bool fromSetting;

  SettingService get controller => getIt.get();

  @override
  Widget build(BuildContext context) {
    return SettingScaffold(
      title: I.of(context).display,
      children: [
        CupertinoListSection.insetGrouped(
          header: SettingGroupTitle(I.of(context).preview),
          hasLeading: false,
          children: [
            SettingTile(
              title: I.of(context).dark_mask,
              trailing: VnSwitchField(
                scale: 0.8,
                value: controller.imageMaskInDarkModeNotifier,
              ),
            ),
            SettingSelectionTile(
              title: I.of(context).image_concurrency,
              value: controller.concurrencyCountNotifier,
              items: [
                SelectTileItem(value: -1, title: I.of(context).no_limit),
                for (var i = 1; i <= 10; i += 2)
                  SelectTileItem(value: i, title: '$i'),
              ],
            ),
          ],
        ),
        CupertinoListSection.insetGrouped(
          header: SettingGroupTitle(I.of(context).read),
          hasLeading: false,
          children: [
            SettingSelectionTile(
              title: I.of(context).pre_load_count,
              value: controller.preloadCountNotifier,
              items: [
                SelectTileItem(
                    value: 0, title: I.of(context).disable), // 0禁用, 只加载自己
                for (var i = 1; i <= 17; i += 2)
                  SelectTileItem(value: i, title: '$i'),
              ],
            ),
            SettingSelectionTile<ReaderDirection>(
              title: I.of(context).read_direction,
              previousPageTitle: I.of(context).display,
              value: controller.readerDirectoryNotifier,
              items: [
                SelectTileItem(
                    value: ReaderDirection.ltr, title: I.of(context).ltr),
                SelectTileItem(
                    value: ReaderDirection.rtl, title: I.of(context).rtl),
                SelectTileItem(
                    value: ReaderDirection.ttb, title: I.of(context).ttb),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
