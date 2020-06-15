/// List extension extends the functionality of the native [List] type by adding
/// a couple of useful methods.
///
/// Adds [as] method to cast the [List] as a [List] of [Type] by applying the
/// given transformation function to each underlying item.
extension ListExtension<E> on List<E> {
  /// Returns a [List] of [Type] by applying the transformation function.
  ///
  /// Shorthand for `List<T>.map<T>(f).toList();`
  List<T> as<T>(T f(E e)) => map<T>(f).toList();
}
