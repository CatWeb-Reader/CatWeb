import 'package:catweb/data/controller/site_service.dart';
import 'package:catweb/data/models/ffi/parser_result.dart';
import 'package:catweb/data/models/site_env_model.dart';
import 'package:catweb/data/models/site_model/pages/site_page.dart';
import 'package:catweb/data/models/site_model/pages/template.dart';
import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/handle.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchListController {
  final ValueChanged<String> onSearch;
  final FocusNode focusNode = FocusNode();
  final Handler handler = Handler();

  final TextEditingController textController = TextEditingController();
  final website = Get.find<SiteService>().website;

  late final SitePage? blueprint;

  final isLoading = false.obs;
  final suggestions = RxList<AutoCompleteParserResultItem>();

  String get splitChar =>
      extra.splitChar.isEmpty ? ' ' : extra.splitChar;

  SearchListController({
    required TemplateList model,
    required this.onSearch,
  }) {
    blueprint = website.blueMap.pageList.get((e) => e.uuid == model.targetAutoComplete);

    if (blueprint != null) {
      textController.addListener(() {
        if (textController.selection.baseOffset == textController.text.length) {
          handler.post(
              extra.timeout, () {
            if (focusNode.hasFocus && textController.text.isNotEmpty) {
              requestAutoComplete(textController.text);
            }
          });
        }
      });
    }
  }

  void onTextChanged(String value) {
    suggestions.clear();
  }

  void onSubmitted(String value) {
    handler.cancel();
    onSearch(value);
    logger.d('NewSearch: $value');
  }

  void requestAutoComplete(String value) {
    final keyWords = value.split(splitChar);
    if (keyWords.isNotEmpty) {
      final keyWord = keyWords.last;
      if (keyWord.isNotEmpty) {
        loadSuggestData(keyWord);
      }
    }
  }

  Future<void> loadSuggestData(String keyword) async {
    isLoading.value = true;
    try {
      final result = await website.client.getAutoComplete(
        url: blueprint!.url,
        model: blueprint!,
        localEnv: SiteEnvStore({
          'search': keyword,
        }),
      );
      suggestions.clear();
      suggestions.addAll(result.items);
    } finally {
      isLoading.value = false;
    }
  }

  void onSuggestionSelected(AutoCompleteParserResultItem item) {
    final keyWords = textController.text.split(splitChar);
    keyWords.removeLast();
    keyWords.add(item.complete!);
    final text = keyWords.join(splitChar) + splitChar;
    textController.value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(TextPosition(
        offset: text.length,
      )),
    );
    onTextChanged(text);
  }

  TemplateAutoComplete get extra =>
      blueprint!.template as TemplateAutoComplete;
}
