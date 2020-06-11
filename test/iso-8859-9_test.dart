import 'package:http/http.dart';
import 'package:test/test.dart';

import 'package:asis/asis.dart';

import 'etc/index.dart';

main() {
  /// https://en.wikipedia.org/wiki/ISO/IEC_8859-9
  Iterable<int> byteData = [0xD0, 0xDD, 0xDE, 0xF0, 0xFD, 0xFE];

  /// Charset response from byteData.
  var charsetResponse = Response(
    String.fromCharCodes(byteData),
    200,
    headers: {
      'charset': 'ISO-8859-9',
    },
  );

  group('ISO-8859-9 decoding', () {
    test('Actual response as ISO-8859-1 (Latin-1)', () {
      expect(charsetResponse.body, 'ÐÝÞðýþ');
    });

    test('Decode as ISO-8859-9 (Latin-5)', () {
      expect(decodeISO88599(charsetResponse.bodyBytes), 'ĞİŞğış');
    });
  });
}
