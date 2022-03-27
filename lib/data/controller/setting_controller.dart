import 'dart:io';
import 'package:catweb/utils/rx_watcher.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

class CardSize {
  static const int small = 1;
  static const int middle = 2;
  static const int large = 3;
  static const int huge = 4;

  static int of(int value) {
    switch (value) {
      case small:
        return 100;
      case middle:
        return 150;
      case large:
        return 200;
      case huge:
        return 250;
    }
    throw UnimplementedError('TODO! $value');
  }
}

class SettingController extends GetxController {
  final cardSize = CardSize.middle.obs;
  final RxInt defaultSite = (-1).obs;
  final RxBool imageMaskInDarkMode = true.obs;
  final RxString documentDir = ''.obs;

  late final CacheOptions imageCacheOption;
  late final CacheOptions cacheOptions;

  late final DbCacheStore dbCacheStore;
  late final MemCacheStore memCacheStore;

  Future<void> init() async {
    cardSize.watch('cardSize', CardSize.middle);
    defaultSite.watch('defaultSite', -1);
    imageMaskInDarkMode.watch('imageMaskInDarkMode', true);
    documentDir.watch('documentDir', '');

    if (documentDir.value.isEmpty) {
      documentDir.value = await getDocumentDir();
    }

    dbCacheStore = DbCacheStore(
      databasePath: p.join(documentDir.value, 'cache'),
    );

    memCacheStore = MemCacheStore(
      maxSize: 100 * 1024 * 1024,
      maxEntrySize: 10 * 1024 * 1024,
    );

    imageCacheOption = CacheOptions(
      store: dbCacheStore,
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403, 500, 501],
      priority: CachePriority.normal,
      maxStale: const Duration(days: 14),
    );

    cacheOptions = CacheOptions(
      store: memCacheStore,
      policy: CachePolicy.noCache,
      maxStale: const Duration(days: 1),
    );

    super.onInit();
  }

  Future<String> getDocumentDir() async {
    final path = Platform.isWindows
        ? await getApplicationSupportDirectory()
        : await getApplicationDocumentsDirectory();

    final sp = await SharedPreferences.getInstance();
    await sp.setString('documentDir', path.path);
    return path.path;
  }
}
