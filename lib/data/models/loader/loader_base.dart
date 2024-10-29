import 'dart:math';

import 'package:catweb/utils/debug.dart';
import 'package:catweb/utils/helper.dart';
import 'package:catweb/utils/iter_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:synchronized/synchronized.dart';

import 'loader_state.dart';

abstract base class LoaderPage<TPageItem> {
  List<TPageItem> get items;
}

abstract base class LoadPageLoaderBase<TPageItem> with ChangeNotifier {
  final Map<int, LoaderPage<TPageItem>> _pages = {};

  final _lock = Lock();
  var _nextPagePointer = -1;
  var _startPage = 0;
  var _state = const LoaderState.idle();

  LoaderState get state => _state;

  Future<LoaderPage<TPageItem>> loadPage(int page);

  Future<void> loadNextPage() async {
    _state = const LoaderState.loading();
    _state = await LoaderState.guard(() async {
      if (_checkIfOutOfRange(_nextPagePointer + 1)) {
        logger.d('下一面${_nextPagePointer + 1}超出范围, 没有更多');
        return;
      }
      await _loadPageData(_nextPagePointer + 1);
      _nextPagePointer += 1;
      if (_checkIfOutOfRange(_nextPagePointer + 1)) {
        logger.d('下一面${_nextPagePointer + 1}超出范围, 没有更多', _nextPagePointer);
        return;
      }
    });

    notifyListeners();
  }

  Future<void> jumpPage(int page) async {
    _nextPagePointer = page - 1;
    _startPage = page;
    await loadNextPage();
  }

  Iterable<TPageItem?> get items => chunkSize == null
      ? successivePages.expand((e) => e.items)
      : _subpageItems;

  Iterable<LoaderPage<TPageItem>> get successivePages => _pages.entries
      .where((e) => e.key >= _startPage)
      .sort((a, b) => a.key - b.key)
      .toList()
      .getSuccessive((e) => e.key)
      .map((e) => e.value);

  Iterable<TPageItem?> get _subpageItems sync* {
    assert(chunkSize != null);
    if (totalCount != null) {
      // 如果有总数, 加载所有数据
      for (var i = 0; i < totalCount!; i++) {
        final index = (i / chunkSize!).floor();
        yield _pages[index]?.items.elementAtOrNull(i % chunkSize!);
      }
    } else {
      // 没有总数, 则数据是连续的
      final maxIndex = _pages.keys.fold(-1, max);
      for (var i = 0; i <= maxIndex; i++) {
        final chunk =
            i == maxIndex ? _pages[maxIndex]!.items.length : chunkSize!;
        for (var j = 0; j < chunk; j++) {
          yield _pages[i]?.items[j];
        }
      }
    }
  }

  Future<bool> _loadPageData(int page) async {
    return await _lock.synchronized<bool>(() async {
      if (_pages.containsKey(page)) {
        return false;
      }
      logger.d('当前页面', _nextPagePointer, '准备加载页面', page);
      _pages[page] = await loadPage(page);
      logger.d('加载', page, '完成');
      return true;
    });
  }

  bool _checkIfOutOfRange(int page) {
    if (totalCount == null || chunkSize == null) return false;
    return page * chunkSize! >= totalCount!;
  }

  int? get chunkSize; // 每面图片数量
  int? get totalCount; // 总图片数据量
}
