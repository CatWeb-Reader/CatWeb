import 'package:catweb/data/database/daos/cookie_jar_dao.dart';
import 'package:catweb/data/database/daos/reader_history_dao.dart';
import 'package:catweb/data/database/daos/web_dao.dart';
import 'package:catweb/data/database/database.dart';
import 'package:get/get.dart';

class DbService extends GetxService {
  static DbService get to => Get.find();
  final AppDataBase _database = AppDataBase();

  WebDao get webDao => _database.webDao;

  ReaderHistoryDao get readerHistoryDao => _database.readerHistoryDao;

  CookieJarDao get cookieJarDao => _database.cookieJarDao;
}