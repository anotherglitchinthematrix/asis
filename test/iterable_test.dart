import 'package:test/test.dart';
import 'package:asis/asis.dart' show IterableExtension;

void main() {
  group('Iterable<T> extension', () {
    var list = [1, 2, 3];

    group('Strict', () {
      test('Transformation with as<T>', () {
        expect(list.asList<String>((e) => e.toString()), ['1', '2', '3']);

        expect(list.asList<String?>((e) => null), [null, null, null]);

        expect(
          list.asList<Map<String, int>>((e) => {e.toString(): e * e}),
          [
            {'1': 1},
            {'2': 4},
            {'3': 9}
          ],
        );
      });

      test('Transformation with the result of as<T>', () {
        expect(
          list.as<String>((e) => e.toString()).asList<String>((e) => e + e),
          ['11', '22', '33'],
        );

        expect(list.as<String?>((e) => null).asList<int>((e) => 1), [1, 1, 1]);

        expect(
          list
              .as<Map<String, int>>((e) => {e.toString(): e * e})
              .asList<String>((e) => e.toString()),
          ['{1: 1}', '{2: 4}', '{3: 9}'],
        );
      });
    });

    group('Automatic', () {
      test('Transformation with as<T>', () {
        expect(list.asList((e) => e.toString()), ['1', '2', '3']);

        expect(list.asList((e) => null), [null, null, null]);

        expect(
          list.asList((e) => {e.toString(): e * e}),
          [
            {'1': 1},
            {'2': 4},
            {'3': 9}
          ],
        );
      });

      test('Transformation with the result of as<T>', () {
        expect(
          list.as((e) => e.toString()).asList((e) => e + e),
          ['11', '22', '33'],
        );

        expect(list.as((e) => null).asList((e) => 1), [1, 1, 1]);

        expect(
          list.as((e) => {e.toString(): e * e}).asList((e) => e.toString()),
          ['{1: 1}', '{2: 4}', '{3: 9}'],
        );
      });
    });
  });
}
