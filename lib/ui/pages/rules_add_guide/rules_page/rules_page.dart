import 'package:catweb/data/constant.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/i18n.dart';
import 'package:catweb/ui/widgets/tab_bar.dart';
import 'package:catweb/ui/pages/rules_add_guide/controller/rules_edit_controller.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/rules_page_basic.dart';
import 'package:catweb/ui/pages/rules_add_guide/rules_page/template_auto_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'list_normal.dart';
import 'list_search.dart';

class RulesPageEdit extends GetView<RulesEditController> {
  const RulesPageEdit({
    super.key,
    required this.model,
  });

  final PageBlueprintModel model;

  @override
  Widget build(BuildContext context) {
    if (model.hasExtraData()) {
      return CupertinoPageScaffold(
        navigationBar: _buildAppbar(context),
        child: CupertinoTabBarView(
          tabs: [
            CupertinoTab(I.of(context).basic),
            if (model.templateData is TemplateListDataModel) ...[
              const CupertinoTab('子页面'),
              CupertinoTab(I.of(context).filter),
            ],
            if (model.templateData is TemplateAutoCompleteModel)
              CupertinoTab(I.of(context).setting),
          ],
          children: [
            RulesPageBasic(model: model),
            if (model.templateData is TemplateListDataModel) ...[
              ListNormalSubPage(model: model),
              ListFilterEditor(model: model),
            ],
            if (model.templateData is TemplateAutoCompleteModel)
              TemplateAutoCompleteFragment(model: model),
          ],
        ),
      );
    }
    return CupertinoPageScaffold(
      navigationBar: _buildAppbar(context),
      child: RulesPageBasic(model: model),
    );
  }

  CupertinoNavigationBar _buildAppbar(BuildContext context) {
    return CupertinoNavigationBar(
      padding: kAppbarPadding,
      leading: CupertinoButton(
        onPressed: () {
          Get.back();
        },
        padding: EdgeInsets.zero,
        minSize: 0,
        child: const Icon(CupertinoIcons.back),
      ),
      middle: Text(I.of(context).page),
      border: model.hasExtraData() ? const Border() : kDefaultNavBarBorder,
    );
  }
}
