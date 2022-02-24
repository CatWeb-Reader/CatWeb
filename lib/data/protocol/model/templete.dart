import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/gen/protobuf/template.pb.dart';
import 'package:catweb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'interface.dart';

PbAble parseTemplate({
  required Template template,
  required List<int> data,
}) {
  switch (template) {
    case Template.TEMPLATE_GALLERY:

    case Template.TEMPLATE_IMAGE_VIEWER:
      return TemplateEmptyModel();

    case Template.TEMPLATE_AUTO_COMPLETE:
      return TemplateAutoCompleteModel();

    case Template.TEMPLATE_IMAGE_LIST:
    case Template.TEMPLATE_IMAGE_WATERFALL:
      return TemplateListDataModel(
        data.isNotEmpty ? TemplateListData.fromBuffer(data) : null,
      );
  }
  throw Exception('Unknown template.proto type $template');
}

class SubPageModel implements PbAble, EnvMargeAble {
  SubPageModel([TemplateListData_SubPage? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        value = sobs(pb?.value);

  final RxString name;
  final RxString key;
  final RxString value;

  @override
  TemplateListData_SubPage toPb() => TemplateListData_SubPage(
        name: name.value,
        key: key.value,
        value: value.value,
      );

  @override
  Map<String, String> get env => <String, String>{name.value: value.value};
}

class TemplateListDataModel implements PbAble {
  final RxList<SubPageModel> subPages;
  final RxString targetItem;

  final RxList<SearchFilterItem> filterItem;
  final RxString targetAutoComplete;
  final RxString script;

  TemplateListDataModel([TemplateListData? pb])
      : subPages =
            lobs(pb?.subPages, (TemplateListData_SubPage e) => SubPageModel(e)),
        targetItem = sobs(pb?.targetItem),
        filterItem = lobs(pb?.filterItem,
            (TemplateListData_FilterItem e) => SearchFilterItem(e)),
        script = sobs(pb?.script),
        targetAutoComplete = sobs(pb?.targetAutoComplete);

  @override
  TemplateListData toPb() => TemplateListData(
        subPages: subPages.map((e) => e.toPb()),
        targetItem: targetItem.value,
        script: script.value,
        filterItem: filterItem.map((e) => e.toPb()),
        targetAutoComplete: targetAutoComplete.value,
      );
}

class SearchFilterItem implements PbAble {
  final RxString name;
  final RxString key;
  final Rx<TemplateListData_FilterType> type;
  final RxString value;

  SearchFilterItem([TemplateListData_FilterItem? pb])
      : name = sobs(pb?.name),
        key = sobs(pb?.key),
        type =
            pb?.type.obs ?? TemplateListData_FilterType.FILTER_TYPE_STRING.obs,
        value = sobs(pb?.value);

  @override
  TemplateListData_FilterItem toPb() => TemplateListData_FilterItem(
        name: name.value,
        key: key.value,
        type: type.value,
        value: value.value,
      );

  SearchFilterItem clone() => SearchFilterItem(toPb());
}

class TemplateAutoCompleteModel implements PbAble {
  final RxString splitChar;
  final RxInt timeout;

  TemplateAutoCompleteModel([TemplateAutoComplete? pb])
      : splitChar = sobs(pb?.splitChar),
        timeout = pb?.timeout.obs ?? RxInt(0);

  @override
  TemplateAutoComplete toPb() => TemplateAutoComplete(
        splitChar: splitChar.value,
        timeout: timeout.value,
      );
}

class TemplateEmptyModel implements PbAble {
  TemplateEmptyModel([TemplateEmpty? pb]);

  @override
  TemplateEmpty toPb() => TemplateEmpty();
}

extension ExtraSelectorTypeTr on TemplateListData_FilterType {
  String string(BuildContext context) {
    switch (this) {
      case TemplateListData_FilterType.FILTER_TYPE_BOOL:
        return '是/否';
      case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
        return '数字';
      case TemplateListData_FilterType.FILTER_TYPE_STRING:
        return '字符串';
    }
    return '';
  }
}

Map<String, dynamic> parseFilter(List<TemplateListData_FilterItem> filter) {
  return Map.fromEntries(filter.map((e) {
    switch (e.type) {
      case TemplateListData_FilterType.FILTER_TYPE_BOOL:
        return MapEntry(e.key, e.value.toLowerCase().trim() == 'true');
      case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
        return MapEntry(e.key, int.tryParse(e.value));
      case TemplateListData_FilterType.FILTER_TYPE_STRING:
        return MapEntry(e.key, e.value);
    }
    return MapEntry(e.key, e.value);
  }));
}
