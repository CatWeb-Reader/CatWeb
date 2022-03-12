import 'dart:convert';

import 'package:catweb/data/controller/site_controller.dart';
import 'package:catweb/data/models/load_more_model.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/templete.dart';
import 'package:catweb/ffi/ffi.dart';
import 'package:catweb/gen/protobuf/model.pbserver.dart';
import 'package:catweb/gen/protobuf/template.pbenum.dart';
import 'package:catweb/ui/pages/view_page/viewer_subpage/image/image_controller.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/replace_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class SubListController extends LoadMoreList<ListRpcModel, ListRpcModel_Item>
    implements ReaderInfo<List<ListRpcModel_Item>> {
  SubListController({
    required this.blueprint,
    this.subPageModel,
  }) : localEnv =
            SiteEnvModel(subPageModel != null && subPageModel.value.isNotEmpty
                ? {
                    subPageModel.key.value.isNotEmpty
                        ? subPageModel.key.value
                        : 'subKey': subPageModel.value.value,
                  }
                : null);

  final PageBlueprintModel blueprint;
  final SubPageModel? subPageModel;
  final SiteEnvModel localEnv;
  final global = Get.find<GlobalController>();

  late final filter = extra.filterItem.map((e) => e.clone()).toList().obs;
  late final currentFilter = filter.map((e) => e.clone()).toList();

  var filterKeys = <String>{};

  @override
  bool isItemExist(ListRpcModel_Item item) => items.any(
      (element) => element.title == item.title && item.target == item.target);

  Future<void> applyFilter([bool refresh = false]) async {
    currentFilter.clear();
    if (useFilter) {
      currentFilter.addAll(filter.map((e) => e.clone()));
      final map = await resolveFilter();
      filterKeys.addAll(map.keys);
      localEnv.mergeMap(map);
    } else {
      localEnv.removeKeys(filterKeys);
    }
    if (refresh) {
      await onRefresh();
    }
  }

  Future<void> onNewSearch(String keywords) async {
    await applyFilter();
    localEnv.mergeMap({'search': keywords.trim()});
    await onRefresh();
  }

  @override
  Future<Tuple2<ListRpcModel, List<ListRpcModel_Item>>> loadPage(
      int page) async {
    var baseUrl = blueprint.url.value;
    if (hasPageExpression(baseUrl) || page == 0) {
      // 有面数
      baseUrl = pageReplace(baseUrl, page);
    } else {
      if (pages.isNotEmpty) {
        baseUrl = pages.last.nextPage;
      }
    }
    baseUrl = localEnv.replace(baseUrl);
    // 添加缓存
    if (subPageModel != null && subPageModel!.key.value.isNotEmpty) {
      localEnv.mergeMap({
        subPageModel!.key.value: subPageModel!.value.value,
      });
    }

    print('加载网址: $baseUrl');
    final data = await global.website.client.getList(
      url: baseUrl,
      model: blueprint,
      localEnv: localEnv,
    );

    if (!hasPageExpression(baseUrl) &&
        (data.nextPage == baseUrl || data.nextPage.isEmpty)) {
      print('hasPageExpression loadNoData()');
      loadNoData();
    }

    return Tuple2(data, data.items);
  }

  void resetFilter() {
    for (var i = 0; i < filter.length; i++) {
      filter[i].value.value = extra.filterItem[i].value.value;
    }
  }

  Future<Map<String, String>> resolveFilter() async {
    final map = <String, dynamic>{};
    for (final item in currentFilter) {
      if (item.key.isNotEmpty) {
        dynamic value;
        switch (item.type.value) {
          case TemplateListData_FilterType.FILTER_TYPE_BOOL_CARD:
          case TemplateListData_FilterType.FILTER_TYPE_BOOL:
            value = item.value.value.trim().toLowerCase() == 'true';
            break;
          case TemplateListData_FilterType.FILTER_TYPE_NUMBER:
            value = int.tryParse(item.value.value);
            break;
          case TemplateListData_FilterType.FILTER_TYPE_STRING:
            value = item.value.value;
            break;
        }
        map[item.key.value] = value;
      }
    }

    final json = jsonEncode(map);
    final result = await compute(runJs, Tuple2(extra.script.value, json));
    if (result.startsWith('{')) {
      try {
        Map<String, dynamic> json2 = jsonDecode(result);
        return json2.map((key, value) => MapEntry(key, value.toString()));
      } catch (e) {
        print('解析过滤器失败: $e');
        return {};
      }
    } else {
      return {'filter': result};
    }
  }

  SiteEnvModel get env => global.website.globalEnv.create(localEnv);

  TemplateListDataModel get extra =>
      blueprint.templateData as TemplateListDataModel;

  bool get useFilter => List.generate(extra.filterItem.length, (i) => i)
      .any((e) => filter[e].value.value != extra.filterItem[e].value.value);

  bool get isFullScreenLoading => items.isEmpty && state.isLoading;

  bool get isFullScreenError => items.isEmpty && errorMessage != null;

  @override
  int? get pageCount => null;

  @override
  TransmissionBufferStream<List<ListRpcModel_Item>, Map<int, String?>>
      get bufferStream => TransmissionBufferStream(
            initData: items,
            stream: items.stream.asBroadcastStream(),
            transmission: (List<ListRpcModel_Item> from) {
              return from.map((e) => e.target).toList().asMap();
            },
          );
}
