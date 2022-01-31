import 'package:catweb/data/protocol/model/page.dart';
import 'package:catweb/data/protocol/model/parser.dart';
import 'package:catweb/gen/protobuf/actions.pbserver.dart';
import 'package:catweb/gen/protobuf/page.pbserver.dart';
import 'package:catweb/gen/protobuf/parser.pbserver.dart';
import 'package:catweb/gen/protobuf/store.pbserver.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

import 'actions.dart';
import 'interface.dart';

class RegFieldModel implements PbAble {
  RegFieldModel([RegField? pb])
      : reg = sobs(pb?.reg),
        value = sobs(pb?.value);

  final RxString reg;
  final RxString value;

  @override
  RegField toPb() => RegField(
        value: value.value,
        reg: reg.value,
      );
}

class SiteConfigModel implements PbAble {
  SiteConfigModel([SiteConfig? pb])
      : name = sobs(pb?.name),
        baseUrl = sobs(pb?.baseUrl),
        cookies = lobs(pb?.cookies, (RegField e) => RegFieldModel(e)),
        headers = lobs(pb?.headers, (RegField e) => RegFieldModel(e)),
        loginUrl = sobs(pb?.loginUrl),
        loginCookie = RegFieldModel(pb?.loginCookie),
        version = sobs(pb?.version),
        upgradeUrl = sobs(pb?.upgradeUrl),
        flag = sobs(pb?.flag),
        detailParsers =
            lobs(pb?.detailParsers, (DetailParser e) => DetailParserModel(e)),
        listViewParsers = lobs(
          pb?.listViewParsers,
          (ListViewParser e) => ListViewParserModel(e),
        ),
        imageParsers = lobs(
          pb?.imageParsers,
          (ImageParser e) => ImageParserModel(e),
        ),
        autoCompleteParsers = lobs(
          pb?.autoCompleteParsers,
          (AutoCompleteParser e) => AutoCompleteParserModel(e),
        ),
        actionList = lobs(
          pb?.actions,
          (ActionCombine e) => ActionCombineModel(e),
        ),
        pageList = lobs(pb?.pages, (SitePage e) => SitePageModel(e));

  factory SiteConfigModel.fromBuffer(List<int> buffer) =>
      SiteConfigModel(SiteConfig.fromBuffer(buffer));

  final RxString name;
  final RxString baseUrl;
  final RxString loginUrl;
  final RegFieldModel loginCookie;
  final RxString version;
  final RxString upgradeUrl;
  final RxString flag;

  final RxList<RegFieldModel> cookies;
  final RxList<RegFieldModel> headers;
  final RxList<DetailParserModel> detailParsers;
  final RxList<ListViewParserModel> listViewParsers;
  final RxList<ImageParserModel> imageParsers;
  final RxList<AutoCompleteParserModel> autoCompleteParsers;
  final RxList<ActionCombineModel> actionList;
  final RxList<SitePageModel> pageList;

  RxList<ParserBaseModel> _selectParser(ParserBaseModel model) {
    switch (model.type) {
      case ParserType.listParser:
        return listViewParsers;
      case ParserType.galleryParser:
        return detailParsers;
      case ParserType.imageParser:
        return imageParsers;
      case ParserType.searchAutoComplete:
        return autoCompleteParsers;
    }
  }

  void removeParser(ParserBaseModel model) {
    _selectParser(model).remove(model);
  }

  void addParser(ParserBaseModel model) {
    _selectParser(model).add(model);
  }

  RxList<ParserBaseModel> get parsers => RxList.from([
        ...listViewParsers,
        ...detailParsers,
        ...imageParsers,
      ]);

  String getParserName(String uuid) => uuid.isEmpty
      ? ''
      : parsers.get((p0) => p0.uuid == uuid)?.name.value ?? 'No parser';

  String getPageName(String uuid) => uuid.isEmpty
      ? ''
      : pageList.get((p0) => p0.uuid == uuid)?.name.value ?? 'No page';

  ListViewParserModel getListParser(String uuid) {
    final result = listViewParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  DetailParserModel getGalleryParser(String uuid) {
    final result = detailParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  ImageParserModel? getImageParser(String uuid) {
    final result = imageParsers.get((e) => e.uuid == uuid);
    if (result == null) throw Exception('Parser $uuid not exist');
    return result;
  }

  @override
  SiteConfig toPb() => SiteConfig(
        name: name.value,
        baseUrl: baseUrl.value,
        cookies: cookies.map((e) => e.toPb()),
        headers: headers.map((e) => e.toPb()),
        loginUrl: loginUrl.value,
        loginCookie: loginCookie.toPb(),
        version: version.value,
        upgradeUrl: upgradeUrl.value,
        flag: flag.value,
        detailParsers: detailParsers.map((e) => e.toPb()),
        listViewParsers: listViewParsers.map((e) => e.toPb()),
        actions: actionList.map((e) => e.toPb()),
        pages: pageList.map((e) => e.toPb()),
      );
}
