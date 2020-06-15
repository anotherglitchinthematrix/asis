import 'dart:convert';

import 'package:http/http.dart';

/// Single entry as Map<String, dynamic>
var single = {
  'key': 'value',
  'list': ['value 1', 'value 2'],
  'boolean': true,
  'number': 1,
  'object': {'key': 'value'},
};

/// Multiple entries as List<Map<String, dynamic>>
var multiple = List.generate(2, (index) => single);

/// Single entry response, encoded as json.
var singleResponse = Response(json.encode(single), 200);

/// Multi entry response, encoded as json.
var multipleResponse = Response(json.encode(multiple), 200);

/// Future of the response. Represents the result of a http call.
var singleResponseFuture = Future(() => singleResponse);

/// Future of the response. Represents the result of a http call.
var multipleResponseFuture = Future(() => multipleResponse);
