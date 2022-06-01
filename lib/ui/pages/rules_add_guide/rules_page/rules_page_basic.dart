import 'package:catweb/data/protocol/model/actions.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/gen/protobuf/page.pbenum.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/gen/protobuf/template.pbserver.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/cupertino_divider.dart';
import 'package:catweb/ui/widgets/cupertino_input.dart';
import 'package:catweb/ui/widgets/dialog.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/theme/colors.dart';
import 'package:catweb/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RulesPageBasic extends GetView<RulesEditController> {
  const RulesPageBasic({
    super.key,
    required this.model,
  });

  final PageBlueprintModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          CupertinoInput(
            labelText: I.of(context).name,
            value: model.name,
          ),
          CupertinoInput(
            labelText: I.of(context).website,
            value: model.url,
          ),
          Obx(() => CupertinoReadOnlyInput(
                labelText: I.of(context).net_action,
                value: model.netAction.value.string,
                onTap: () => _onNetActionTap(context),
              )),
          Obx(() {
            if (model.netAction.value == NetActionType.NET_ACTION_TYPE_POST) {
              return CupertinoInput(
                labelText: I.of(context).form,
                value: model.formData,
                minLine: 4,
              );
            }
            return const SizedBox();
          }),
          Obx(() => CupertinoReadOnlyInput(
                labelText: I.of(context).parser,
                value:
                    controller.blueprint.getParserName(model.baseParser.value),
                onTap: () => _onParserTap(context),
              )),
          const CupertinoDivider(height: 20),
          if ([Template.TEMPLATE_IMAGE_WATERFALL, Template.TEMPLATE_IMAGE_LIST]
              .contains(model.template.value))
            Obx(() => CupertinoReadOnlyInput(
                  labelText: I.of(context).display_type,
                  value: model.display.value.string(context),
                  onTap: () => _onDisplayTap(context),
                )),
          _buildIcon(context),
          _buildOpenNewPage(context),
        ],
      ),
    );
  }

  Widget _buildOpenNewPage(BuildContext context) {
    late final List<Widget> body;
    switch (model.template.value) {
      case Template.TEMPLATE_AUTO_COMPLETE:
      case Template.TEMPLATE_IMAGE_VIEWER:
        body = [];
        break;

      case Template.TEMPLATE_IMAGE_LIST:
      case Template.TEMPLATE_IMAGE_WATERFALL:
        final extra = model.templateData as TemplateListDataModel;
        body = [
          _buildOpenWidget(
            context,
            labelText: I.of(context).item_jump_to,
            target: extra.targetItem,
          ),
          _buildOpenWidget(
            context,
            labelText: I.of(context).auto_complete_jump_to,
            target: extra.targetAutoComplete,
            filter: (item) =>
                item.template.value == Template.TEMPLATE_AUTO_COMPLETE,
          ),
        ];
        break;
      case Template.TEMPLATE_GALLERY:
        final extra = model.templateData as TemplateGalleryModel;
        body = [
          _buildOpenWidget(
            context,
            labelText: I.of(context).read_jump_to,
            target: extra.targetReader,
            filter: (item) =>
                item.template.value == Template.TEMPLATE_IMAGE_VIEWER,
          ),
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
                child: Obx(() => Icon(
                      cupertinoIcons[model.icon.value] ?? CupertinoIcons.app,
                      color: CupertinoColors.systemBlue.resolveFrom(context),
                    )),
                onPressed: () async {
                  final result = await showCupertinoIconDialog(context);
                  if (result != null && result.isNotEmpty) {
                    model.icon.value = result;
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
      items: model.template.value
          .parser(controller.blueprint.parsers)
          .map((e) => SelectTileItem(title: e.name.value, value: e.uuid))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      model.baseParser.value = result;
    }
  }

  Future<void> _onNetActionTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<NetActionType>(
      title: I.of(context).select_net_action,
      context: context,
      items: NetActionType.values
          .map((e) => SelectTileItem(title: e.string, value: e))
          .toList(),
      cancelText: I.of(context).negative,
    );
    if (result != null) {
      model.netAction.value = result;
    }
  }

  Widget _buildOpenWidget(
    BuildContext context, {
    required String labelText,
    required RxString target,
    bool Function(PageBlueprintModel)? filter,
  }) {
    return Obx(() => CupertinoReadOnlyInput(
          labelText: labelText,
          value: controller.blueprint.getPageName(target.value),
          onTap: () => showCupertinoSelectDialog(
            context: context,
            items: [
              ...controller.blueprint.pageList
                  .where((e) => filter != null ? filter(e) : true)
                  .map((e) => SelectTileItem(
                        title: e.name.string,
                        value: e.uuid,
                      )),
              SelectTileItem(title: I.of(context).none, value: ''),
            ],
          ).then((value) {
            if (value != null) {
              target.value = value;
            }
          }),
        ));
  }

  Future<void> _onDisplayTap(BuildContext context) async {
    final result = await showCupertinoSelectDialog<SiteDisplayType>(
      title: I.of(context).display_type,
      context: context,
      items: SiteDisplayType.values
          .map((e) => SelectTileItem<SiteDisplayType>(
              title: e.string(context), value: e))
          .toList(),
      cancelText: I.of(context).negative,
    );

    if (result != null) {
      model.display.value = result;
    }
  }
}
