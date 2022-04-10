import 'package:catweb/data/controller/setting_controller.dart';
import 'package:catweb/data/controller/setting_enum.dart';
import 'package:catweb/data/database/database.dart';
import 'package:catweb/utils/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:math' as math;

import 'image_controller.dart';
import 'package:get/get.dart';

class ImagePageController {
  ImagePageController({
    required this.controller,
  });

  final ImageReaderController controller;
  final PageController pageController = PageController();

  final listController = ItemScrollController();

  final Rx<int> _currentPage = 0.obs;

  var _isForwardDirection = 0;

  void onPageInitFinish() {
    if (controller.readerInfo.startPage != null) {
      if (controller.readerInfo.startPage! > 0) {
        final start = _getDisplayIndex(controller.readerInfo.startPage!);
        _currentPage.value = start;
        pageController.jumpToPage(start);
      } else {
        _currentPage.value = 0;
        onPageIndexChanged(0);
      }
    } else {
      _currentPage.value = 0;
      onPageIndexChanged(0);
    }
  }

  int _getRealIndex(int index) {
    if (displayType == ReaderDisplayType.single) {
      return index;
    } else if (displayType == ReaderDisplayType.double) {
      return index * 2;
    } else if (displayType == ReaderDisplayType.doubleCover) {
      return math.max((index - 1) * 2 + 1, 0);
    }
    return 0;
  }

  bool isSingleWidget(int index) {
    switch (displayType) {
      case ReaderDisplayType.double: // 普通双面多出一面
        return controller.imageLoaderList.length.isOdd &&
            index == displayPageCount - 1;
      case ReaderDisplayType.doubleCover: // 封面双面的封面和多出的一面

        return index == 0 ||
            (controller.imageLoaderList.length.isEven &&
                index == displayPageCount - 1);
      case ReaderDisplayType.single: // 单面
      default:
        return true;
    }
  }

  Future<void> onPageIndexChanged(int index) async {
    final realIndex = _getRealIndex(index);
    if (realIndex >= controller.imageLoaderList.length) {
      return;
    }
    logger.d('翻页到: $index -> $realIndex');

    if ((realIndex - currentPage).abs() == 1) {
      // 跳页不作为翻页
      if (realIndex > currentPage) {
        _isForwardDirection =
            _isForwardDirection >= 2 ? 2 : _isForwardDirection + 1;
      } else {
        _isForwardDirection =
            _isForwardDirection <= -3 ? -3 : _isForwardDirection - 1;
      }
    }
    _currentPage.value = realIndex;
    // 预加载
    await controller.requestLoadImageModelIndex(index, isForwardDirection);

    // 记录加载数据
    if (controller.readerInfo.idCode != null) {
      final db = DB().readerHistoryDao;
      final entity = await db.get(
        uuid: controller.readerInfo.fromUuid,
        idCode: controller.readerInfo.idCode!,
      );
      if (entity != null) {
        await db.replace(entity.copyWith(
          pageIndex: realIndex,
        ));
      }
    }
  }

  void toNextPage() {
    final displayIndex = _getDisplayIndex(index);

    if (displayIndex < displayPageCount - 1) {
      jumpToPage(displayIndex + 1);
    }
  }

  void toPreviousPage() {
    final displayIndex = _getDisplayIndex(index);
    if (displayIndex - 1 > 0) {
      jumpToPage(displayIndex - 1);
    }
  }

  void jumpToPage(int index) {
    final displayIndex = _getDisplayIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(displayIndex);
    }
    if (listController.isAttached) {
      listController.scrollTo(index: index, duration: 200.milliseconds);
    }
  }

  int _getDisplayIndex(int index) {
    switch (displayType) {
      case ReaderDisplayType.double:
        return (index / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return ((index + 1) / 2).floor();
      case ReaderDisplayType.single:
      default:
        return index;
    }
  }

  int get displayPageCount {
    switch (displayType) {
      case ReaderDisplayType.double:
        return 1 + ((controller.imageLoaderList.length - 1) / 2).ceil();
      case ReaderDisplayType.doubleCover:
        return (controller.imageLoaderList.length / 2).ceil();
      case ReaderDisplayType.single:
      default:
        return controller.imageLoaderList.length;
    }
  }

  int get displayType => Get.find<SettingController>().displayType.value;

  int get index => _getRealIndex((pageController.page ?? 0).toInt());

  int get currentPage => _currentPage.value;

  Rx<int> get rxPage => _currentPage;

  bool get isForwardDirection => _isForwardDirection >= 0;
}
