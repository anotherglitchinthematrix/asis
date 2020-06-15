import 'package:test/test.dart';
import 'package:asis/asis.dart' show FutureIterable;

void main() {
  group('Future<Iterable<T>> extension', () {
    test('first', () async {
      expect(await Future(() => [1, 2, 3]).first, 1);
    });

    test('isEmpty', () async {
      expect(await Future(() => [1, 2, 3]).isEmpty, false);

      expect(await Future(() => []).isEmpty, true);
    });

    test('isNotEmpty', () async {
      expect(await Future(() => [1, 2, 3]).isNotEmpty, true);

      expect(await Future(() => []).isNotEmpty, false);
    });

    test('iterator', () async {});

    test('last', () async {
      expect(await Future(() => [1, 2, 3]).last, 3);
    });

    test('iterator', () async {});

    test('length', () async {
      expect(await Future(() => [1, 2, 3]).length, 3);
    });

    test('single', () async {
      expect(() => Future(() => [1, 2, 3]).single, throwsStateError);

      expect(() => Future(() => []).single, throwsStateError);

      expect(() => Future(() => [1, 2]).single, throwsStateError);

      expect(await Future(() => [1]).single, 1);
    });

    test('either (any)', () async {
      expect(await Future(() => [1, 2, 3]).either((e) => e > 2), true);

      expect(await Future(() => [1, 2, 3]).either((e) => e == 404), false);
    });

    test('cast', () async {
      expect(await Future(() => [1, 2, 3]).cast<num>(), [1, 2, 3]);
    });

    test('contains', () async {
      expect(await Future(() => [1, 2, 3]).contains(null), false);

      expect(await Future(() => [1, 2, 3]).contains(2), true);

      expect(await Future(() => [1, 2, 3]).contains(404), false);
    });

    test('elementAt', () async {
      expect(await Future(() => [1, 2, 3]).elementAt(0), 1);

      expect(() => Future(() => [1, 2, 3]).elementAt(-15), throwsRangeError);
    });

    test('every', () async {
      expect(
        await Future(() => [1, 2, 3]).every((element) => element > 0),
        true,
      );

      expect(
        await Future(() => [1, 2, 3]).every((element) => element < 0),
        false,
      );
    });

    test('expand', () async {
      expect(
        await Future(
          () => [
            [1, 2],
            [3, 4],
          ],
        ).expand((e) => e),
        [1, 2, 3, 4],
      );

      expect(
        await Future(() => [1, 2, 3]).expand((e) => [e, e * 2]),
        [1, 2, 2, 4, 3, 6],
      );
    });

    test('firstWhere', () async {
      expect(await Future(() => [1, 2, 3]).firstWhere((e) => e > 2), 3);

      expect(
        () => Future(() => [1, 2, 3]).firstWhere((e) => e < 0),
        throwsStateError,
      );

      expect(
        await Future(() => [1, 2, 3]).firstWhere(
          (e) => e < 0,
          orElse: () => -1,
        ),
        -1,
      );
    });

    test('fold', () async {
      expect(await Future(() => [1, 2, 3]).fold(0, (p, n) => p + n), 6);

      expect(await Future(() => [1, 2, 3]).fold(660, (p, n) => p + n), 666);
    });

    test('followedBy', () async {
      expect(await Future(() => [1, 2, 3]).followedBy([]), [1, 2, 3]);

      expect(await Future(() => [1, 2, 3]).followedBy(null), [1, 2, 3]);

      expect(
        await Future(() => [1, 2, 3]).followedBy([4, 5, 6]),
        [1, 2, 3, 4, 5, 6],
      );
    });

    test('each (forEach)', () async {
      expect(
        await Future(() async {
          var list = [];
          await Future(() => [1, 2, 3]).each((e) => list.add(e * 2));
          return list;
        }),
        [2, 4, 6],
      );
    });

    test('join', () async {
      expect(await Future(() => [1, 2, 3]).join(), '123');

      expect(await Future(() => [1, 2, 3]).join('?'), '1?2?3');
    });

    test('lastWhere', () async {
      expect(await Future(() => [1, 2, 3]).lastWhere((e) => e < 2), 1);

      expect(
        () => Future(() => [1, 2, 3]).lastWhere((e) => e < 0),
        throwsStateError,
      );

      expect(
        await Future(() => [1, 2, 3]).lastWhere(
          (e) => e < 0,
          orElse: () => -1,
        ),
        -1,
      );
    });

    test('map', () async {
      expect(await Future(() => [1, 2, 3]).map((e) => e * 2), [2, 4, 6]);
    });

    test('reduce', () async {
      expect(await Future(() => [1, 2, 3]).reduce((p, n) => p + n), 6);
    });

    test('singleWhere', () async {
      expect(await Future(() => [1, 2, 3]).singleWhere((e) => e == 2), 2);

      expect(
        () => Future(() => [1, 2, 3]).singleWhere((e) => e < 3),
        throwsStateError,
      );

      expect(
        () => Future(() => [1, 2, 3]).singleWhere((e) => e < 0),
        throwsStateError,
      );

      expect(
        await Future(() => [1, 2, 3]).singleWhere(
          (e) => e < 0,
          orElse: () => -1,
        ),
        -1,
      );
    });

    test('skip', () async {
      expect(await Future(() => [1, 2, 3]).skip(2), [3]);

      expect(await Future(() => [1, 2, 3]).skip(100), []);

      expect(
        () async => await Future(() => [1, 2, 3]).skip(-1),
        throwsRangeError,
      );
    });

    test('skipWhile', () async {
      expect(await Future(() => [1, 2, 3]).skipWhile((e) => e > 0), []);

      expect(await Future(() => [1, 2, 3]).skipWhile((e) => e < 2), [2, 3]);
    });

    test('take', () async {
      expect(await Future(() => [1, 2, 3]).take(2), [1, 2]);

      expect(await Future(() => [1, 2, 3]).take(100), [1, 2, 3]);

      expect(
        () async => await Future(() => [1, 2, 3]).take(-1),
        throwsRangeError,
      );
    });

    test('takeWhile', () async {
      expect(await Future(() => [1, 2, 3]).takeWhile((e) => e > 0), [1, 2, 3]);

      expect(await Future(() => [1, 2, 3]).takeWhile((e) => e < 2), [1]);
    });

    test('toList', () async {
      expect(await Future(() => [1, 2, 3]).toList(), [1, 2, 3]);
    });

    test('toSet', () async {
      expect(await Future(() => [1, 2, 3]).toSet(), Set.from([1, 2, 3]));
    });

    test('where', () async {
      expect(await Future(() => [1, 2, 3]).where((e) => e < 3), [1, 2]);
    });

    test('whereType', () async {
      var mixed = Future(() => ['a', 1, 'b', 2, [], {}, true]);

      expect(await mixed.whereType<String>(), ['a', 'b']);

      expect(await mixed.whereType<int>(), [1, 2]);

      expect(await mixed.whereType<num>(), [1, 2]);

      expect(await mixed.whereType<bool>(), [true]);

      expect(await mixed.whereType<List>(), [[]]);

      expect(await mixed.whereType<Iterable>(), [[]]);

      expect(await mixed.whereType<Map>(), [{}]);
    });

    test('as<T>', () async {
      expect(
        await Future(() => [1, 2, 3]).as<String>((e) => e.toString()),
        [1, 2, 3].map((e) => e.toString()),
      );
    });

    test('asList<T>', () async {
      expect(
        await Future(() => [1, 2, 3]).asList<String>((e) => e.toString()),
        [1, 2, 3].map((e) => e.toString()).toList(),
      );
    });
  });
}
