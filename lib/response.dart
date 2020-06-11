import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'iso-8859-9.dart';

/// Response extension extends the functionality of the [Response] type by
/// adding a couple of useful methods.
///
/// Adds [jsonBody] getter to get the JSON decoded body of the response.
///
/// Adds [as] method to cast the JSON decoded body as an object of given [Type]
/// by applying the given transformation function.
///
/// Adds [asList] method to cast the JSON decoded body as a [List] of the given
/// [Type] by applying the given transformation function to each item.
extension ResponseExtension on Response {
  /// Get the content-type of the response.
  String get _contentType => headers['content-type'] ?? "";

  /// Get the charset of the response.
  String? get _charset => _contentType != ""
        ? MediaType.parse(_contentType).parameters['charset']
        : null;


  /// Check if the charset is ISO-8859-9.
  bool get _isISO88599 => _charset == 'ISO-8859-9';

  /// Returns the body of the response.
  ///
  /// This is a helper getter for decoding the ISO-8859-9 encoded body before
  /// decoding as JSON. If the body encoded as ISO-8859-9, decodes the body from
  /// bodyBytes to save time, elsewise returns the default body of the response.
  String get _body => _isISO88599 ? decodeISO88599(bodyBytes) : body;

  /// JSON decoded [body] of the request, as-is.
  ///
  /// Returns a dynamic object that might be a `Map<String, dynamic>` or
  /// `List<Map<String, dynamic>>` on runtime according to decoded [body].
  get jsonBody => json.decode(_body);

  /// Cast the [jsonBody] as [Type] by applying the transformation function.
  T as<T>(T f(Map<String, dynamic> e)) => f(jsonBody);

  /// Cast the [jsonBody] as a lazy [Iterable] of [Type] by applying the
  /// transformation function to each underlying item.
  Iterable<T> asIterable<T>(T f(Map<String, dynamic> e)) {
    return Iterable.castFrom<dynamic, Map<String, dynamic>>(jsonBody).map<T>(f);
  }

  /// Cast the [jsonBody] as a [List] of [Type] by applying the transformation
  /// function to each underlying item.
  List<T> asList<T>(T f(Map<String, dynamic> e)) => asIterable<T>(f).toList();
}
