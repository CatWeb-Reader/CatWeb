import 'dart:io';
import 'package:catweb/utils/rx_watcher.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

class CardSize {
  factory CardSize.small() => CardSize.from(100);

  factory CardSize.medium() => CardSize.from(150);

  factory CardSize.large() => CardSize.from(200);

  factory CardSize.huge() => CardSize.from(250);

  CardSize.from(this.size);

  final int size;

  @override
  bool operator ==(Object other) {
    return (other is CardSize && other.size == size) ||
        (other is int && other == size);
  }

  @override
  int get hashCode => size;
}

class SettingController extends GetxController {
  // 内部储存设置
  final RxInt defaultSite = (-1).obs;
  final RxString documentDir = ''.obs;

  // 阅读设置
  final RxBool imageMaskInDarkMode = true.obs;
  final cardSize = CardSize.medium().size.obs;
  final RxInt preloadCount = 7.obs;
  final RxInt concurrencyCount = 5.obs;

  // 下载设置

  // 其他数据
  late final CacheOptions imageCacheOption;
  late final CacheOptions cacheOptions;

  late final DbCacheStore dbCacheStore;
  late final MemCacheStore memCacheStore;

  Future<void> init() async {
    cardSize.watch('cardSize', CardSize.medium().size);
    defaultSite.watch('defaultSite', -1);
    imageMaskInDarkMode.watch('imageMaskInDarkMode', true);
    documentDir.watch('documentDir', '');
    preloadCount.watch('preloadCount', 7);
    concurrencyCount.watch('concurrencyCount', 5);

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
      policy: CachePolicy.forceCache,
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
