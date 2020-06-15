import 'package:http/http.dart';
import 'asis.dart' show ResponseExtension;

/// Future response extension maps the [ResponseExtension] methods to the result
/// of a [Future] that yields a [Response].
extension FutureResponse on Future<Response> {
  /// JSON decoded [body] of the request, as a result of a future, as-is.
  ///
  /// Returns a dynamic object that might be a `Map<String, dynamic>` or
  /// `List<Map<String, dynamic>>` on runtime according to decoded [body].
  Future<dynamic> get jsonBody async => (await this).jsonBody;

  /// Cast the [jsonBody] as [Type] by applying the transformation function, as
  /// a result of future.
  Future<T> as<T>(T f(Map<String, dynamic> e)) async => (await this).as<T>(f);

  /// Cast the [jsonBody] as a lazy [Iterable] of [Type], as a result of a
  /// future.
  Future<Iterable<T>> asIterable<T>(T f(Map<String, dynamic> e)) async {
    return (await this).asIterable(f);
  }

  /// Cast the [jsonBody] as a [List] of [Type], as a result of a future.
  Future<List<T>> asList<T>(T f(Map<String, dynamic> e)) async {
    return (await this).asList<T>(f);
  }
}
