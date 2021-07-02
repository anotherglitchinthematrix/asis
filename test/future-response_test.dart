import 'package:test/test.dart';
import 'package:asis/asis.dart';
import 'etc/index.dart';

void main() {
  group('Future<Response> transformation', () {
    group('On single result', () {
      test('jsonBody from response', () async {
        expect(await singleResponseFuture.jsonBody, single);
      });

      test('Strict transforming', () async {
        expect(await singleResponseFuture.as<bool>((e) => e['boolean']), true);
      });

      test('Dynamic transforming', () async {
        expect(await singleResponseFuture.as((e) => e['boolean']), true);
      });

      test('Strict transforming to CustomObject', () async {
        expect(
          await singleResponseFuture
              .as<CustomObject>((e) => CustomObject.fromJson(e)),
          CustomObject.fromJson(single),
        );
      });

      test('Dynamic transforming to CustomObject', () async {
        expect(
          await singleResponseFuture.as((e) => CustomObject.fromJson(e)),
          CustomObject.fromJson(single),
        );
      });
    });

    group('On multiple result', () {
      test('jsonBody from response', () async {
        expect(await multipleResponseFuture.jsonBody, multiple);
      });

      test('Strict transforming', () async {
        expect(
          await multipleResponseFuture.asList<bool>((e) => e['boolean']),
          [true, true],
        );
      });

      test('Dynamic transforming', () async {
        expect(
          await multipleResponseFuture.asList((e) => e['boolean']),
          [true, true],
        );
      });

      test('Strict transforming to CustomObject', () async {
        expect(
          await multipleResponseFuture.asList<CustomObject>(
            (e) => CustomObject.fromJson(e),
          ),
          multiple.map((e) => CustomObject.fromJson(e)),
        );
      });

      test('Dynamic transforming to CustomObject', () async {
        expect(
          await multipleResponseFuture.asList((e) => CustomObject.fromJson(e)),
          multiple.map((e) => CustomObject.fromJson(e)),
        );
      });

      test('Future<List<T>> manipulation', () async {
        expect(
          await multipleResponseFuture
              .asIterable((e) => CustomObject.fromJson(e))
              .asList<bool?>((e) => e.boolean),
          multiple.as((e) => CustomObject.fromJson(e).boolean),
        );
      });
    });
  });
}
