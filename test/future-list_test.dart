import 'package:test/test.dart';
import 'package:asis/asis.dart' show FutureList;

void main() {
  group('Future<List<T>> extension', () {
    test('reversed', () async {
      expect(await Future(() => [1, 2, 3]).reversed, [1, 2, 3].reversed);
    });

    test('add', () async {
      expect(await Future(() => [1, 2, 3]).add(4), [1, 2, 3, 4]);
    });

    test('addAll', () async {
      expect(await Future(() => [1, 2, 3]).addAll([4, 5]), [1, 2, 3, 4, 5]);
    });

    test('asMap', () async {
      expect(await Future(() => [1, 2, 3]).asMap(), {0: 1, 1: 2, 2: 3});
    });

    test('cast', () async {
      expect(await Future(() => [1, 2, 3]).cast<num>(), [1, 2, 3]);
    });

    test('clear', () async {
      expect(await Future(() => [1, 2, 3]).clear(), []);
    });

    test('fillRange', () async {
      expect(await Future(() => [1, 2, 3]).fillRange(1, 3, 0), [1, 0, 0]);
    });

    test('getRange', () async {
      expect(
        await Future(() => [1, 2, 3]).getRange(1, 3),
        [1, 2, 3].getRange(1, 3),
      );
    });

    test('indexOf', () async {
      expect(await Future(() => [1, 2, 3]).indexOf(2), 1);

      expect(await Future(() => [1, 2, 3]).indexOf(5), -1);
    });

    test('indexWhere', () async {
      expect(await Future(() => [1, 2, 3]).indexWhere((e) => e >= 2), 1);

      expect(await Future(() => [1, 2, 3]).indexWhere((e) => e >= 5), -1);
    });

    test('insert', () async {
      expect(await Future(() => [1, 2, 3]).insert(0, 0), [0, 1, 2, 3]);
    });

    test('insertAll', () async {
      expect(
        await Future(() => [1, 2, 3]).insertAll(0, [-1, 0]),
        [-1, 0, 1, 2, 3],
      );
    });

    test('lastIndexOf', () async {
      expect(
        await Future(() => [1, 2, 2, 3]).lastIndexOf(2),
        [1, 2, 2, 3].lastIndexOf(2),
      );

      expect(
        await Future(() => [1, 2, 2, 3]).lastIndexOf(5),
        [1, 2, 2, 3].lastIndexOf(5),
      );
    });

    test('lastIndexWhere', () async {
      expect(
        await Future(() => [1, 2, 3]).lastIndexWhere((e) => e >= 2),
        [1, 2, 3].lastIndexWhere((e) => e >= 2),
      );

      expect(
        await Future(() => [1, 2, 3]).lastIndexWhere((e) => e >= 5),
        [1, 2, 3].lastIndexWhere((e) => e >= 5),
      );
    });

    test('remove', () async {
      expect(await Future(() => [1, 2, 3]).remove(2), [1, 3]);
    });

    test('removeAt', () async {
      expect(await Future(() => [1, 2, 3]).removeAt(2), [1, 2]);

      expect(
        () async => await Future(() => [1, 2, 3]).removeAt(5),
        throwsRangeError,
      );
    });

    test('removeLast', () async {
      expect(await Future(() => [1, 2, 3]).removeLast(), [1, 2]);
    });

    test('removeWhere', () async {
      expect(await Future(() => [1, 2, 3]).removeWhere((e) => e >= 2), [1]);
    });

    test('replaceRange', () async {
      expect(
        await Future(() => [1, 2, 3]).replaceRange(0, 1, [1, 2, 3]),
        [1, 2, 3]..replaceRange(0, 1, [1, 2, 3]),
      );
    });

    test('retainWhere', () async {
      expect(
        await Future(() => [1, 2, 3]).retainWhere((e) => e >= 2),
        [1, 2, 3]..retainWhere((e) => e >= 2),
      );
    });

    test('setRange', () async {
      expect(
        await Future(() => [1, 2, 3]).setRange(0, 1, [1, 2, 3]),
        [1, 2, 3]..setRange(0, 1, [1, 2, 3]),
      );
    });

    test('shuffle', () async {
      /// Can't mimic...
    });

    test('sort', () async {
      int sorter1(int a, int b) => a.compareTo(b);

      int sorter2(int a, int b) => b.compareTo(a);

      expect(await Future(() => [1, 2, 3]).sort(), [1, 2, 3]);

      expect(
        await Future(() => [1, 2, 3]).sort(sorter1),
        [1, 2, 3]..sort(sorter1),
      );

      expect(
        await Future(() => [1, 2, 3]).sort(sorter2),
        [1, 2, 3]..sort(sorter2),
      );
    });

    test('sublist', () async {
      expect(await Future(() => [1, 2, 3]).sublist(1, 3), [2, 3]);
    });

    test('as', () async {
      expect(
        await Future(() => [1, 2, 3]).as<String>((e) => e.toString()),
        [1, 2, 3].map((e) => e.toString()),
      );
    });

    test('asList', () async {
      expect(
        await Future(() => [1, 2, 3]).as<String>((e) => e.toString()),
        [1, 2, 3].map((e) => e.toString()).toList(),
      );
    });
  });
}
