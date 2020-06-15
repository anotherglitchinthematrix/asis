import 'package:test/test.dart';
import 'package:asis/asis.dart' show ListExtension;

void main() {
  group('List<T> extension', () {
    var list = [1, 2, 3];

    group('Strict', () {
      test('Transformation with as<T>', () {
        expect(list.as<String>((e) => e.toString()), ['1', '2', '3']);
      });
    });

    group('Automatic', () {
      test('Transformation with as<T>', () {
        expect(list.as((e) => e.toString()), ['1', '2', '3']);
      });
    });
  });
}
