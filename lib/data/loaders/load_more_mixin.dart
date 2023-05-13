import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:synchronized/synchronized.dart';
import 'package:get/get.dart';

class LoadListStatue {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final bool isRefresh;
  final Exception? error;
  final bool isComplete;

  LoadListStatue._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isComplete = false,
    this.isRefresh = false,
    this.error,
  });

  factory LoadListStatue.idle() => LoadListStatue._(isIdle: true);

  factory LoadListStatue.loading() => LoadListStatue._(isLoading: true);

  factory LoadListStatue.error(Exception error) => LoadListStatue._(
        isError: true,
        error: error,
      );

  factory LoadListStatue.complete() => LoadListStatue._(isComplete: true);

  factory LoadListStatue.refresh() => LoadListStatue._(isRefresh: true);

  bool get canLoadMore => isIdle || isError;

  bool get isRunning => isLoading || isRefresh;
}

mixin LoadListStateMixin {
  final _state = LoadListStatue.idle().obs;

  LoadListStatue get state => _state.value;

  void stateLoadStart() => _state.value = LoadListStatue.loading();

  void stateLoadNoData() => _state.value = LoadListStatue.complete();

  void stateLoadComplete() =>
      state.isRunning ? _state.value = LoadListStatue.idle() : null;

  void stateLoadError(Exception error) {
    if (error is DioError && CancelToken.isCancel(error)) {
      return;
    }
    _state.value = LoadListStatue.error(error);
  }

  void stateLoadRefresh() => _state.value = LoadListStatue.refresh();

  String? get errorMessage => state.error?.toString();
}

class LoadStatue {
  final bool isIdle;
  final bool isLoading;
  final bool isError;
  final Exception? error;
  final bool isComplete;

  LoadStatue._({
    this.isLoading = false,
    this.isError = false,
    this.isIdle = false,
    this.isComplete = false,
    this.error,
  });

  factory LoadStatue.idle() => LoadStatue._(isIdle: true);

  factory LoadStatue.loading() => LoadStatue._(isLoading: true);

  factory LoadStatue.error(Exception error) => LoadStatue._(
        isError: true,
        error: error,
      );

  factory LoadStatue.complete() => LoadStatue._(isComplete: true);
}

mixin LoadStateMixin {
  final _state = LoadListStatue.idle().obs;

  LoadListStatue get state => _state.value;

  void loadStart() => _state.value = LoadListStatue.loading();

  void loadComplete() => _state.value = LoadListStatue.complete();

  void loadError(Exception error) {
    if (error is DioError && CancelToken.isCancel(error)) {
      loadComplete();
      return;
    }
    _state.value = LoadListStatue.error(error);
  }

  bool get canLoad => state.isIdle || state.isError;
}

abstract class LoadMoreBase with LoadListStateMixin {
  @protected
  final requestLock = Lock();

  final refreshController = RefreshController();

  Future<void> awaitLock() => requestLock.synchronized(() {});

  @override
  void stateLoadComplete() {
    super.stateLoadComplete();
    if (state.isComplete || state.isIdle) {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  @override
  void stateLoadNoData() {
    super.stateLoadNoData();
    refreshController.loadNoData();
  }

  @override
  void stateLoadError(Exception error) {
    super.stateLoadError(error);
    refreshController.loadFailed();
  }

  void dispose() {
    refreshController.dispose();
  }
}

class ImageLoadState {
  ImageLoadState._({
    this.isCached = false,
    this.isWaiting = false,
    this.isFinish = false,
    this.isError = false,
    this.isLoading = false,
    this.error,
  });

  final bool isCached;
  final bool isWaiting;
  final bool isFinish;
  final bool isError;
  final bool isLoading;
  Exception? error;

  bool get isIdle => isWaiting || isCached;

  factory ImageLoadState.cached() => ImageLoadState._(isCached: true);

  factory ImageLoadState.waiting() => ImageLoadState._(isWaiting: true);

  factory ImageLoadState.finish() => ImageLoadState._(isFinish: true);

  factory ImageLoadState.loading() => ImageLoadState._(isLoading: true);

  factory ImageLoadState.error([Exception? error]) =>
      ImageLoadState._(isError: true, error: error);

  @override
  String toString() {
    if (isCached) {
      return 'ImageLoadState.cached';
    } else if (isWaiting) {
      return 'ImageLoadState.waiting';
    } else if (isFinish) {
      return 'ImageLoadState.finish';
    } else if (isError) {
      return 'ImageLoadState.error';
    } else if (isLoading) {
      return 'ImageLoadState.loading';
    }
    return 'ImageLoadState.idle';
  }
}
