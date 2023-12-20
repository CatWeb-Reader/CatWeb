import 'dart:async';
import 'dart:convert';
import 'package:catweb/data/controller/db_service.dart';
import 'package:catweb/data/controller/setting_service.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_model/site_blue_map.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/navigator.dart';
import 'package:catweb/network/client/client.dart';
import 'package:catweb/utils/helper.dart';
import 'package:flutter/cupertino.dart';

class SiteService {
  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  var lastClickBack = DateTime.now().millisecondsSinceEpoch;

  final site = ValueNotifier<SiteRenderConfigModel?>(null);

  Future<void> setNewSite([WebTableData? db]) async {
    if (db != null) {
      site.value = SiteRenderConfigModel(
        dbEntity: db,
        blueMap: SiteBlueMap.fromJson(jsonDecode(db.blueprint)),
      );
      get<SettingService>().defaultSite.value = db.id;
    } else {
      site.value = null;
    }
  }

  Future<void> setDefaultSite() async {
    final setting = get<SettingService>();
    final df = (await get<DbService>().webDao.getAll())
        .get((e) => e.id == setting.defaultSite.value);
    await setNewSite(df);
  }

  Future<void> autoSelectNewSite() async {
    final sitesList = await get<DbService>().webDao.getAll();
    if (sitesList.isNotEmpty) {
      final site = sitesList.first;
      await setNewSite(site);
    } else {
      await setNewSite();
    }
  }

  Future<void> init() async {
    try {
      await setDefaultSite();
    } catch (e) {
      print(e); // TODO 错误处理
    }
    siteDbChangeListener =
        get<DbService>().webDao.getAllStream().listen((event) {
      // 检测当前网站的配置是否被更新
      final currentNewSite = event.get((e) => e.id == id);
      if (currentNewSite != null) {
        if (currentNewSite.loginCookies != site.value!.dbEntity.loginCookies ||
            currentNewSite.blueprint != site.value!.dbEntity.blueprint) {
          setNewSite(currentNewSite);
          return;
        }
      }

      // 检测是否被删除
      if (id != null && currentNewSite == null) {
        autoSelectNewSite();
        return;
      }
      if (site.value == null && event.isNotEmpty) {
        autoSelectNewSite();
        return;
      }
    });
  }

  int? get id => site.value?.id;

  NetClient? get client => site.value?.client;
}
