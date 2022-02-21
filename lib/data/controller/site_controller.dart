import 'dart:async';
import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/data/models/site_render_model.dart';
import 'package:catweb/data/protocol/model/store.dart';
import 'package:catweb/network/client/cilent.dart';
import 'package:catweb/utils/utils.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  late final StreamSubscription<List<WebTableData>> siteDbChangeListener;

  final site = Rx<SiteRenderConfigModel?>(null);

  SiteRenderConfigModel get website {
    assert(site.value != null);
    return site.value!;
  }

  Future<void> setNewSite([WebTableData? db]) async {
    if (db != null) {
      site.value = SiteRenderConfigModel(
        dbEntity: db,
        configModel: SiteBlueprintModel.fromBuffer(db.bin),
      );
      final setting = Get.find<SettingController>();
      setting.defaultSite.value = db.id;
    } else {
      site.value = null;
    }
  }

  Future<void> setDefaultSite() async {
    final setting = Get.find<SettingController>();
    final df = (await DB().webDao.getAll())
        .get((e) => e.id == setting.defaultSite.value);
    await setNewSite(df);
  }

  Future<void> autoSelectNewSite() async {
    final sitesList = await DB().webDao.getAll();
    if (sitesList.isNotEmpty) {
      final site = sitesList.first;
      await setNewSite(site);
    } else {
      await setNewSite();
    }
  }

  @override
  void onInit() {
    setDefaultSite();
    siteDbChangeListener = DB().webDao.getAllStream().listen((event) {
      if (site.value != null &&
          event.get((element) => element.id == id) == null) {
        autoSelectNewSite();
      } else if (site.value == null && event.isNotEmpty) {
        autoSelectNewSite();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    siteDbChangeListener.cancel();
    super.onClose();
  }

  int? get id => site.value?.id;

  NetClient? get client => site.value?.client;
}
