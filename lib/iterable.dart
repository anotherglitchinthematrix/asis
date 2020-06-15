/// Iterable extension extends the functionality of the native [Iterable] type
/// by adding a couple of useful methods.
///
/// Adds [as] method to cast the [Iterable] as a lazy [Iterable] of [Type] by
/// applying the given transformation function to each underlying item.
///
/// Adds [asList] method to cast the [Iterable] as a lazy [Iterable] of [Type]
/// and return as [List] of [Type] by applying the given transformation function
/// to each underlying item.
extension IterableExtension<E> on Iterable<E> {
  /// Returns a new lazy [Iterable] of [Type] by applying the transformation
  /// function.
  ///
  /// Shorthand for `Iterable<T>.map<T>(f);`
  Iterable<T> as<T>(T f(E e)) => map<T>(f);

  /// Returns a new [List] of [Type] by applying the transformation function.
  ///
  /// Shorthand for `Iterable<T>.map<T>(f).toList();`
  List<T> asList<T>(T f(E e)) => map<T>(f).toList();
}
