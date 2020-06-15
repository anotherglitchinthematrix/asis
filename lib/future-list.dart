import 'dart:math';
import 'asis.dart' show ListExtension;

/// Future list extension maps the native [List] properties and methods to the
/// result of a [Future] that yields a [List], in addition with a couple of
/// useful return types and methods.
extension FutureList<E> on Future<List<E>> {
  /// Refer to [List.reversed].
  Future<Iterable<E>> get reversed async => (await this).reversed;

  /// Refer to [List.add].
  ///
  /// Additionally returns the list.
  Future<List<E>> add(E e) async => (await this)..add(e);

  /// Refer to [List.addAll].
  ///
  /// Additionally returns the list.
  Future<List<E>> addAll(Iterable<E> iterable) async {
    return (await this)..addAll(iterable);
  }

  /// Refer to [List.asMap].
  Future<Map<int, E>> asMap() async => (await this).asMap();

  /// Refer to [List.cast].
  Future<List<R>> cast<R>() async => (await this).cast<R>();

  /// Refer to [List.clear].
  ///
  /// Additionally returns the list.
  Future<List<E>> clear() async => (await this)..clear();

  /// Refer to [List.fillRange].
  ///
  /// Additionally returns the list.
  Future<List<E>> fillRange(int start, int end, [E value]) async {
    return (await this)..fillRange(start, end, value);
  }

  /// Refer to [List.getRange].
  Future<Iterable<E>> getRange(int start, int end) async {
    return (await this).getRange(start, end);
  }

  /// Refer to [List.indexOf].
  Future<int> indexOf(E e, [int start = 0]) async {
    return (await this).indexOf(e, start);
  }

  /// Refer to [List.indexWhere].
  Future<int> indexWhere(bool test(E e), [int start = 0]) async {
    return (await this).indexWhere(test, start);
  }

  /// Refer to [List.insert].
  ///
  /// Additionally returns the list.
  Future<List<E>> insert(int index, E element) async {
    return (await this)..insert(index, element);
  }

  /// Refer to [List.insertAll].
  ///
  /// Additionally returns the list.
  Future<List<E>> insertAll(int index, Iterable<E> iterable) async {
    return (await this)..insertAll(index, iterable);
  }

  /// Refer to [List.lastIndexOf].
  Future<int> lastIndexOf(E e, [int start]) async {
    return (await this).lastIndexOf(e, start);
  }

  /// Refer to [List.lastIndexWhere].
  Future<int> lastIndexWhere(bool test(E e), [int start]) async {
    return (await this).lastIndexWhere(test, start);
  }

  /// Refer to [List.remove].
  ///
  /// Additionally returns the list.
  Future<List<E>> remove(Object o) async => (await this)..remove(o);

  /// Refer to [List.removeAt].
  ///
  /// Additionally returns the list.
  Future<List<E>> removeAt(int index) async => (await this)..removeAt(index);

  /// Refer to [List.removeLast].
  ///
  /// Additionally returns the list.
  Future<List<E>> removeLast() async => (await this)..removeLast();

  /// Refer to [List.removeRange].
  ///
  /// Additionally returns the list.
  Future<List<E>> removeRange(int start, int end) async {
    return (await this)..removeRange(start, end);
  }

  /// Refer to [List.removeWhere].
  ///
  /// Additionally returns the list.
  Future<List<E>> removeWhere(bool test(E e)) async {
    return (await this)..removeWhere(test);
  }

  /// Refer to [List.replaceRange].
  ///
  /// Additionally returns the list.
  Future<List<E>> replaceRange(int start, int end, Iterable<E> iterable) async {
    return (await this)..replaceRange(start, end, iterable);
  }

  /// Refer to [List.retainWhere].
  ///
  /// Additionally returns the list.
  Future<List<E>> retainWhere(bool test(E e)) async {
    return (await this)..retainWhere(test);
  }

  /// Refer to [List.setAll].
  ///
  /// Additionally returns the list.
  Future<List<E>> setAll(int index, Iterable<E> iterable) async {
    return (await this)..setAll(index, iterable);
  }

  /// Refer to [List.setRange].
  ///
  /// Additionally returns the list.
  Future<List<E>> setRange(int start, int end, Iterable<E> iterable) async {
    return (await this)..setRange(start, end, iterable);
  }

  /// Refer to [List.shuffle].
  ///
  /// Additionally returns the list.
  Future<List<E>> shuffle([Random random]) async {
    return (await this)..shuffle(random);
  }

  /// Refer to [List.sort].
  ///
  /// Additionally returns the list.
  Future<List<E>> sort([int compare(E a, E b)]) async {
    return (await this)..sort(compare);
  }

  /// Refer to [List.sublist].
  Future<List<E>> sublist(int start, [int end]) async {
    return (await this).sublist(start, end);
  }

  /// Returns a new lazy [List] of [Type] by applying the transformation
  /// function.
  ///
  /// Short hand for `Future<List<T>>.map<T>(f);`
  Future<List<T>> as<T>(T f(E e)) async => (await this).as<T>(f);
}
