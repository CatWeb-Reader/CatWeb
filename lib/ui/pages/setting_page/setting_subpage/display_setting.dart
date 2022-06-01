import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_obs_swiitch.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_group.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_base.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_selection.dart';
import 'package:catweb/ui/pages/setting_page/widgets/setting_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DisplaySettingPage extends GetView<SettingController> {
  const DisplaySettingPage({
    super.key,
    this.fromSetting = true,
  });

  final bool fromSetting;

  @override
  Widget build(BuildContext context) {
    return SettingScaffold(
      title: I.of(context).display,
      children: [
        SettingGroupTitle(I.of(context).preview),
        SettingGroupWidget(
          children: [
            SettingTile(
              title: I.of(context).dark_mask,
              trailing: CupertinoObxSwitch(
                scale: 0.9,
                value: controller.imageMaskInDarkMode,
              ),
            ),
            const SettingDivider(),
            SettingSelectionTile(
              title: I.of(context).image_concurrency,
              value: controller.concurrencyCount,
              items: [
                SelectTileItem(value: -1, title: I.of(context).disable),
                SelectTileItem(value: 0, title: I.of(context).no_limit),
                for (var i = 1; i <= 10; i += 2)
                  SelectTileItem(value: i, title: '$i'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SettingGroupTitle(I.of(context).read),
        SettingGroupWidget(
          children: [
            SettingSelectionTile(
              title: I.of(context).pre_load_count,
              value: controller.preloadCount,
              items: [
                SelectTileItem(value: 0, title: I.of(context).disable),
                for (var i = 1; i <= 17; i += 2)
                  SelectTileItem(value: i, title: '$i'),
              ],
            ),
            const SettingDivider(),
            SettingSelectionTile<int>(
              title: I.of(context).read_direction,
              previousPageTitle: I.of(context).display,
              value: controller.readerDirectory,
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
