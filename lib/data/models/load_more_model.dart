import 'dart:async';

import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/state_mixin.dart';
import 'package:catweb/utils/utils.dart';
import 'package:dio/dio.dart' hide Lock;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';
import 'package:tuple/tuple.dart';

abstract class LoadMoreBase with LoadStateMixin {
  final _requestLock = Lock();

  final refreshController = RefreshController();

  Future<void> awaitLock() => _requestLock.synchronized(() {});

  @override
  void loadComplete() {
    super.loadComplete();
    if (state.isComplete || state.isIdle) {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  @override
  void loadNoData() {
    super.loadNoData();
    refreshController.loadNoData();
  }

  @override
  void loadError(Exception error) {
    super.loadError(error);
    refreshController.loadFailed();
  }
}

abstract class LoadMoreList<E, T> extends LoadMoreBase {
  final RxList<T> items = <T>[].obs;
  final RxList<E> pages = <E>[].obs;

  final RxInt _page = (-1).obs; // 加载更多是从page=0开始的

  Future<Tuple2<E, List<T>>> loadPage(int page);

  bool isItemExist(T item);

  Future<void> onLoadMore() async {
    try {
      await _requestLock.synchronized(() async {
        loadStart();
        final loadItems = await loadPage(_page.value + 1);
        _page.value += 1;
        if (loadItems.item2.isEmpty) {
          loadNoData();
        } else {
          items.addAll(loadItems.item2.where((e) => !isItemExist(e)));
          pages.add(loadItems.item1);
          loadComplete();
        }
      });
    } on Exception catch (e) {
      loadError(e);
    }
  }

  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    items.clear();
    pages.clear();
    _page.value = -1;
    loadRefresh();
    await onLoadMore();
  }

  void dispose() {
    refreshController.dispose();
  }

  void requestFirstLoad() {
    if (items.isEmpty && state.isIdle) {
      onRefresh();
    }
  }

  Future<void> requestLoadPage(int page) =>
      throw UnsupportedError('Load More List not support requestLoadPage');

  Future<void> requestLoadIndex(int page, [RxBool? isStop]) =>
      throw UnsupportedError('Load More List not support requestLoadIndex');
}

abstract class LoadMoreMap<E, T> extends LoadMoreBase {
  final RxMap<int, E?> pages = <int, E?>{}.obs;
  final RxMap<int, T?> items = <int, T?>{}.obs;

  int? get chunkSize; // 每块图片数量, 如果为null则只能一面一面跳页

  int? get totalSize; // 一共有多少图片, 为null则不允许跳页

  String get baseUrl;

  /// page是由0开始的, 所以初始为-1, 在 +1 后变为0
  final RxInt _page = (-1).obs; // 初始加载页面记录

  /// 加载(page)面的数据, 这里的page是以0开始的
  Future<Tuple2<E, List<T>>> loadPage(int page);

  bool isItemExist(T item);

  /// 加载下一面数据
  Future<void> onLoadMore() async {
    try {
      if (!checkIfOutOfRange(_page.value)) {
        await onJumpPage(_page.value + 1);
        loadComplete();
        if (checkIfOutOfRange(_page.value)) {
          logger.i('下一面超出范围, 没有更多', _page.value);
          loadNoData();
        }
      } else {
        loadNoData();
      }
    } on DioError catch (e) {
      loadError(e);
    } on Exception catch (e) {
      loadError(e);
    }
  }

  /// 检查加载的数据是否已经超出范围
  bool checkIfOutOfRange(int page) {
    if (totalSize == null || chunkSize == null) return false;
    return (page + 1) * chunkSize! >= totalSize!;
  }

  /// 这里传入的page应该是以0开始的, 第一面就是0
  Future<void> onJumpPage(int page) async {
    await _requestLock.synchronized(() async {
      if (pages.containsKey(page)) return;
      logger.i('当前页面', _page.value, '准备加载页面', page);
      loadStart();
      final pageData = await loadPage(page);
      pages[page] = pageData.item1;
      // 如果没有每面页数的话, 则不允许直接跳转对应面数, 只能一面一面加载, 直接寻找到最大位置即可
      if (chunkSize == null) {
        // 如果一面一面加载没有数据了, 就说明加载完毕
        if (pageData.item2.isEmpty) loadNoData();
        final realLength = pages.realLength;
        items.addEntries(List.generate(pageData.item2.length,
            (i) => MapEntry(i + realLength, pageData.item2[i])));
        logger.i('加载', page, '完成, 其index为', realLength, '~',
            page * chunkSize! + pageData.item2.length);
      } else {
        // 有最大面数的话, 则在对应的位置进行加载
        items.addEntries(List.generate(pageData.item2.length,
            (i) => MapEntry(page * chunkSize! + i, pageData.item2[i])));
        logger.i('加载', page, '完成, 其index为', page * chunkSize!, '~',
            page * chunkSize! + pageData.item2.length);
      }

      _page.value = page;
    });
  }

  /// 请求加载index, 由index换算成需要加载的面数, 然后请求加载
  /// 该请求有两个调用方:
  ///     1. 阅读里请求加载idCode
  ///     2. 阅读预览里请求下载缩略图
  /// 由于上面两个方法调用时并不知道画廊组成, 所以对于同一面会重复调用多次
  final requestLoadLock = Lock();

  Future<void> requestLoadIndex(int index, [RxBool? stop]) async {
    return await requestLoadLock.synchronized(() async {
      if (totalSize == null || chunkSize == null) {
        // 没有确切的面数, 只能一面面加载
        while (items.maxIndex < index) {
          if (stop?.isTrue ?? false) {
            break;
          }
          await onLoadMore();
        }
      } else {
        // 有确切的面数, 直接加载
        final page = (index / chunkSize!).floor();
        await onJumpPage(page);
      }
    });
  }

  Future<void> onRefresh() async {
    if (_requestLock.locked) return awaitLock();
    pages.clear();
    items.clear();
    _page.value = -1;
    loadRefresh();
    await onLoadMore();
  }

  Future<void> requestLoadPage(int page) => onJumpPage(page);
}
