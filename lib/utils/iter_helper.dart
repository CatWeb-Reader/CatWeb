import 'dart:math' as math;

extension IterableUtils<T> on Iterable<T> {
  T? get(bool Function(T e) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }

  Iterable<T> sort([int Function(T a, T b)? compare]) {
    return toList()..sort(compare);
  }
}

extension IterableMath<T extends num> on Iterable<T> {
  T? max() {
    if (isEmpty) return null;
    return reduce((value, element) => math.max(value, element));
  }

  T? min() {
    if (isEmpty) return null;
    return reduce((value, element) => math.min(value, element));
  }
}
