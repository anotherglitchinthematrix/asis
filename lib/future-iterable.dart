import 'asis.dart' show IterableExtension;

/// Future iterable extension maps the native [Iterable] properties and methods
/// to the result of a [Future] that yields an [Iterable], in addition with a
/// couple of useful return types and methods.
extension FutureIterable<E> on Future<Iterable<E>> {
  /// Refer to [Iterable.first];
  Future<E> get first async => (await this).first;

  /// Refer to [Iterable.isEmpty];
  Future<bool> get isEmpty async => (await this).isEmpty;

  /// Refer to [Iterable.isNotEmpty];
  Future<bool> get isNotEmpty async => (await this).isNotEmpty;

  /// Refer to [Iterable.iterator];
  Future<Iterator<E>> get iterator async => (await this).iterator;

  /// Refer to [Iterable.last];
  Future<E> get last async => (await this).last;

  /// Refer to [Iterable.length];
  Future<int> get length async => (await this).length;

  /// Refer to [Iterable.single];
  Future<E> get single async => (await this).single;

  /// Refer to [Iterable.any];
  Future<bool> either(bool test(e)) async => (await this).any(test);

  /// Refer to [Iterable.cast];
  Future<Iterable<R>> cast<R>() async => (await this).cast<R>();

  /// Refer to [Iterable.contains];
  Future<bool> contains(Object e) async => (await this).contains(e);

  /// Refer to [Iterable.elementAt];
  Future<E> elementAt(int index) async => (await this).elementAt(index);

  /// Refer to [Iterable.every];
  Future<bool> every(bool test(E e)) async => (await this).every(test);

  /// Refer to [Iterable.expand];
  Future<Iterable<T>> expand<T>(Iterable<T> f(E e)) async {
    return (await this).expand(f);
  }

  /// Refer to [Iterable.firstWhere];
  Future<E> firstWhere(bool test(E e), {E orElse()}) async {
    return (await this).firstWhere(test, orElse: orElse);
  }

  /// Refer to [Iterable.fold];
  Future<T> fold<T>(T i, T combine(T p, E n)) async {
    return (await this).fold(i, (p, n) => combine(p, n));
  }

  /// Refer to [Iterable.followedBy];
  Future<Iterable<E>> followedBy(Iterable<E> other) async {
    return (await this).followedBy(other);
  }

  /// Refer to [Iterable.forEach];
  ///
  /// Additionally returns the iterable.
  Future<Iterable<E>> each(void f(E e)) async => (await this)..forEach(f);

  /// Refer to [Iterable.join];
  Future<String> join([String seperator = ""]) async {
    return (await this).join(seperator);
  }

  /// Refer to [Iterable.lastWhere];
  Future<E> lastWhere(bool test(E e), {E orElse()}) async {
    return (await this).lastWhere(test, orElse: orElse);
  }

  /// Refer to [Iterable.map];
  Future<Iterable<T>> map<T>(T f(E e)) async => (await this).map(f);

  /// Refer to [Iterable.reduce];
  Future<E> reduce(E combine(E v, E e)) async {
    return (await this).reduce(combine);
  }

  /// Refer to [Iterable.singleWhere];
  Future<E> singleWhere(bool test(E e), {E orElse()}) async {
    return (await this).singleWhere(test, orElse: orElse);
  }

  /// Refer to [Iterable.skip];
  Future<Iterable<E>> skip(int count) async => (await this).skip(count);

  /// Refer to [Iterable.skipWhile];
  Future<Iterable<E>> skipWhile(bool test(E e)) async {
    return (await this).skipWhile(test);
  }

  /// Refer to [Iterable.take];
  Future<Iterable<E>> take(int count) async => (await this).take(count);

  /// Refer to [Iterable.takeWhile];
  Future<Iterable<E>> takeWhile(bool test(E e)) async {
    return (await this).takeWhile(test);
  }

  /// Refer to [Iterable.toList];
  Future<List<E>> toList({bool growable: true}) async {
    return (await this).toList(growable: growable);
  }

  /// Refer to [Iterable.toSet];
  Future<Set<E>> toSet() async => Set<E>.from((await this));

  /// Refer to [Iterable.where];
  Future<Iterable<E>> where(bool test(E e)) async {
    return (await this).where(test);
  }

  /// Refer to [Iterable.whereType];
  Future<Iterable<T>> whereType<T>() async => (await this).whereType<T>();

  /// Returns a new lazy [Iterable] of [Type] by applying the transformation
  /// function.
  ///
  /// Short hand for `Future<Iterable<T>>.map<T>(f);`
  Future<Iterable<T>> as<T>(T f(E e)) async => (await this).as<T>(f);

  /// Returns a new [List] of [Type] by applying the transformation function.
  ///
  /// Shorthand for `List<T>.map<T>(f).toList();`
  Future<List<T>> asList<T>(T f(E e)) async => (await this).asList<T>(f);
}
