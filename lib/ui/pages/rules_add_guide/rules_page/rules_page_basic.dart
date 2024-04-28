import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/data/models/site_model/pages/template_gallery.dart';
import 'package:catweb/data/models/site_model/pages/template_list.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/icons.dart';
import 'package:catweb/utils/widget.dart';
import 'package:flutter/cupertino.dart';

class RulesPageBasic extends StatelessWidget {
  const RulesPageBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoVnTextInput(
            labelText: I.of(context).name,
            value: sitePage.name,
          ),
          CupertinoVnTextInput(
            labelText: I.of(context).website,
            value: sitePage.url,
          ),
          CupertinoSelectInput(
            field: sitePage.action,
            labelText: I.of(context).net_action,
            items: SiteNetType.values,
            selectionConverter: (value) => value.value,
          ),
          sitePage.action.obx((v) {
            if (v == SiteNetType.post) {
              return CupertinoVnTextInput(
                labelText: I.of(context).form,
                value: sitePage.formData,
                minLine: 4,
              );
            }
            return const SizedBox();
          }),
          controller.blueprint.parserList.obx(() {
            return CupertinoReadOnlyInput(
              labelText: I.of(context).parser,
              value: controller.blueprint.parserList
                      .get((e) => e.uuid == sitePage.parserId.value)
                      ?.name ??
                  'No parser',
              onTap: () => _onParserTap(context),
            );
          }),
          const CupertinoDivider(height: 20),
          if ([TemplateType.imageWaterFall, TemplateType.imageList]
              .contains(sitePage.template.type))
            sitePage.displayType.obx((v) => CupertinoReadOnlyInput(
                  labelText: I.of(context).display_type,
                  value: v.value,
                  onTap: () => _onDisplayTap(context),
                )),
          _buildIcon(context),
          _buildOpenNewPage(context),
        ],
      ),
    );
  }

  Widget _buildOpenNewPage(
    BuildContext context,
  ) {
    late final List<Widget> body;

    switch (sitePage.template.type) {
      case TemplateType.autoComplete:
      case TemplateType.imageViewer:
        body = [];
        break;

      case TemplateType.imageList:
      case TemplateType.imageWaterFall:
        final extra = sitePage.template as TemplateList;
        body = [
          _buildOpenWidget(context,
              labelText: I.of(context).item_jump_to,
              target: extra.targetItem.value, onTargetChanged: (value) {
            extra.targetItem.value = value ?? '';
          }),
          _buildOpenWidget(context,
              labelText: I.of(context).auto_complete_jump_to,
              target: extra.targetAutoComplete.value,
              filter: (item) => item.template.type == TemplateType.autoComplete,
              onTargetChanged: (value) {
                extra.targetAutoComplete.value = value ?? '';
              }),
        ];
        break;
      case TemplateType.gallery:
        final extra = sitePage.template as TemplateGallery;
        body = [
          _buildOpenWidget(context,
              labelText: I.of(context).read_jump_to,
              target: extra.targetReader.value,
              filter: (item) => item.template.type == TemplateType.imageViewer,
              onTargetChanged: (value) {
                extra.targetReader.value = value ?? '';
              }),
        ];
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...body,
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I.of(context).icon,
            style: TextStyle(
                color: FixColor.title.resolveFrom(context), fontSize: 13),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              CupertinoButton(
                color: CupertinoColors.systemGroupedBackground
                    .resolveFrom(context),
                padding: EdgeInsets.zero,
                child: sitePage.icon.obx((v) => Icon(
                      cupertinoIcons[v] ?? CupertinoIcons.app,
                      color: CupertinoColors.systemBlue.resolveFrom(context),
                    )),
                onPressed: () async {
                  final result = await showCupertinoIconDialog(context);
                  if (result != null && result.isNotEmpty) {
                    sitePage.icon.value = result;
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _onParserTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<String>(
      title: I.of(context).select_parser,
      context: context,
      items: controller.blueprint.parserList
          .where((e) => e.parserType == sitePage.acceptParserType())
          .map((e) => SelectTileItem(title: e.name, value: e.uuid))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      sitePage.parserId.value = result;
    }
  }

  Widget _buildOpenWidget(
    BuildContext context, {
    required String labelText,
    required String target,
    bool Function(SitePage)? filter,
    required void Function(String?) onTargetChanged,
  }) {
    return controller.blueprint.pageList.obx(() => CupertinoReadOnlyInput(
          labelText: labelText,
          value: controller.blueprint.pageList
                  .get((e) => e.uuid == target)
                  ?.name
                  .value ??
              I.of(context).none,
          onTap: () => showCupertinoSelectDialog(
            context: context,
            items: [
              ...controller.blueprint.pageList
                  .where((e) => filter != null ? filter(e) : true)
                  .map((e) => SelectTileItem(
                        title: e.name.value,
                        value: e.uuid,
                      )),
              SelectTileItem(title: I.of(context).none, value: ''),
            ],
          ).then((value) {
            onTargetChanged(value);
          }),
        ));
  }

  Future<void> _onDisplayTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<SiteDisplayType>(
      title: I.of(context).display_type,
      context: context,
      items: SiteDisplayType.values
          .map((e) => SelectTileItem<SiteDisplayType>(title: e.value, value: e))
          .toList(),
      cancelText: I.of(context).negative,
    );

    if (result != null) {
      sitePage.displayType.value = result;
    }
  }
}
