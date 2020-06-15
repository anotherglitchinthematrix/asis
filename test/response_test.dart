import 'package:test/test.dart';
import 'package:asis/asis.dart' show ResponseExtension;
import 'etc/index.dart';

void main() {
  group('Response transformation', () {
    group('On single result', () {
      test('jsonBody from response', () {
        expect(singleResponse.jsonBody, single);
      });

      test('Strict transforming', () {
        expect(singleResponse.as<bool>((e) => e['boolean']), true);
      });

      test('Dynamic transforming', () {
        expect(singleResponse.as((e) => e['boolean']), true);
      });

      test('Strict transforming to CustomObject', () {
        expect(
          singleResponse.as<CustomObject>((e) => CustomObject.fromJson(e)),
          CustomObject.fromJson(single),
        );
      });

      test('Dynamic transforming to CustomObject', () {
        expect(
          singleResponse.as((e) => CustomObject.fromJson(e)),
          CustomObject.fromJson(single),
        );
      });
    });

    group('On multiple result', () {
      test('jsonBody from response', () {
        expect(multipleResponse.jsonBody, multiple);
      });

      test('Strict transforming', () {
        expect(
          multipleResponse.asList<bool>((e) => e['boolean']),
          [true, true],
        );
      });

      test('Dynamic transforming', () {
        expect(multipleResponse.asList((e) => e['boolean']), [true, true]);
      });

      test('Strict transforming to CustomObject', () {
        expect(
          multipleResponse.asList<CustomObject>(
            (e) => CustomObject.fromJson(e),
          ),
          multiple.map((e) => CustomObject.fromJson(e)),
        );
      });

      test('Dynamic transforming to CustomObject', () {
        expect(
          multipleResponse.asList((e) => CustomObject.fromJson(e)),
          multiple.map((e) => CustomObject.fromJson(e)),
        );
      });
    });
  });
}
