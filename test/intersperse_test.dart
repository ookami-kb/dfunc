import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('intersperse', () {
    test('for empty list returns empty', () {
      expect(<int>[].intersperse(0), <int>[]);
    });

    test('for empty list with beforeFirst and afterLast returns empty', () {
      expect(
        <int>[].intersperse(0, beforeFirst: true, afterLast: true),
        <int>[],
      );
    });

    test('for single-item list does not add anything', () {
      expect(<int>[1].intersperse(0), <int>[1]);
    });

    test('for 2-items list adds 1 element', () {
      expect(<int>[1, 2].intersperse(0), <int>[1, 0, 2]);
    });

    test('for 3-items list adds 2 elements', () {
      expect(<int>[1, 2, 3].intersperse(0), <int>[1, 0, 2, 0, 3]);
    });

    test('for single-item list with beforeFirst adds one before', () {
      expect(<int>[1].intersperse(0, beforeFirst: true), <int>[0, 1]);
    });

    test('for single-item list with afterLast adds one after', () {
      expect(<int>[1].intersperse(0, afterLast: true), <int>[1, 0]);
    });

    test('for single-item list with beforeFirst and afterLast', () {
      expect(
        <int>[1].intersperse(0, beforeFirst: true, afterLast: true),
        <int>[0, 1, 0],
      );
    });

    test('for 2-items list with beforeFirst', () {
      expect(<int>[1, 2].intersperse(0, beforeFirst: true), <int>[0, 1, 0, 2]);
    });

    test('for 2-items list with afterLast', () {
      expect(<int>[1, 2].intersperse(0, afterLast: true), <int>[1, 0, 2, 0]);
    });

    test('for 2-items list with beforeFirst and afterLast', () {
      expect(
        <int>[1, 2].intersperse(0, beforeFirst: true, afterLast: true),
        <int>[0, 1, 0, 2, 0],
      );
    });
  });

  group('intersperseWith', () {
    String buildItem(int a) => a.toString();
    String buildSeparator(int a, int b) => '<$a-$b>';

    Iterable<String> sut(
      Iterable<int> items, {
      bool beforeFirst = false,
      bool afterLast = false,
    }) =>
        items.intersperseWith(
          itemBuilder: buildItem,
          separatorBuilder: buildSeparator,
          beforeFirst: beforeFirst ? (item) => '<<$item' : null,
          afterLast: afterLast ? (item) => '$item>>' : null,
        );

    test('for empty list returns empty', () {
      expect(sut(<int>[]), <int>[]);
    });

    test('for empty list with beforeFirst and afterLast returns empty', () {
      expect(
        sut(<int>[], beforeFirst: true, afterLast: true),
        <int>[],
      );
    });

    test('for single-item list does not add anything', () {
      expect(sut([1]), ['1']);
    });

    test('for 2-items list adds 1 element', () {
      expect(sut([1, 2]), ['1', '<1-2>', '2']);
    });

    test('for 3-items list adds 2 elements', () {
      expect(sut([1, 2, 3]), ['1', '<1-2>', '2', '<2-3>', '3']);
    });

    test('for single-item list with beforeFirst adds one before', () {
      expect(sut([1], beforeFirst: true), ['<<1', '1']);
    });

    test('for single-item list with afterLast adds one after', () {
      expect(sut([1], afterLast: true), ['1', '1>>']);
    });

    test('for single-item list with beforeFirst and afterLast', () {
      expect(
        sut([1], beforeFirst: true, afterLast: true),
        ['<<1', '1', '1>>'],
      );
    });

    test('for 2-items list with beforeFirst', () {
      expect(sut([1, 2], beforeFirst: true), ['<<1', '1', '<1-2>', '2']);
    });

    test('for 2-items list with afterLast', () {
      expect(sut([1, 2], afterLast: true), ['1', '<1-2>', '2', '2>>']);
    });

    test('for 2-items list with beforeFirst and afterLast', () {
      expect(
        sut([1, 2], beforeFirst: true, afterLast: true),
        ['<<1', '1', '<1-2>', '2', '2>>'],
      );
    });
  });
}
