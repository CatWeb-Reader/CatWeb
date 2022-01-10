import 'dart:core' as core;
import 'dart:core';
import 'dart:math' as math;
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

extension IterableUtils<T> on Iterable<T> {
  T? get(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}

extension ListHelper<T> on List<T> {
  T random() {
    return this[math.Random().nextInt(length)];
  }

  T? index(int index) {
    if (length > index && index >= 0) {
      return this[index]!;
    }
    return null;
  }

  List<T> addIfNotExist(Iterable<T> other) {
    addAll(other.where((e) => !contains(e)));
    return this;
  }

  T lastAt(int index) {
    return this[length - index];
  }
}

extension AnimationControllerHelper on AnimationController {
  void byValue(bool display) {
    if (display && atEnd) reverse();
    if (!display && atStart) forward();
  }

  void play(bool isForward) {
    if (isForward) {
      forward();
    } else {
      reverse();
    }
  }

  bool get atStart => value == 0.0;

  bool get atEnd => value == 1.0;
}

T df<T>(T? value, T defaultValue, bool Function()? has) =>
    has != null && has() ? value ?? defaultValue : defaultValue;

RxString sobs(String? pb) => pb?.obs ?? ''.obs;

RxBool bobs(bool? pb) => pb?.obs ?? false.obs;

RxList<T> lobs<T, E>(core.Iterable<E>? pb, T Function(E e) func) =>
    pb?.map((E e) => func(e)).toList().obs ?? <T>[].obs;
