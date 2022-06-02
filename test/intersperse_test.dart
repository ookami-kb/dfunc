import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('intersperse', () {
    test('for empty list returns empty', () {
      expect(<int>[].intersperse(0), <int>[]);
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
  });

  group('intersperseWith', () {
    String buildItem(int a) => a.toString();
    String buildSeparator(int a, int b) => '<$a-$b>';

    sut(Iterable<int> items) => items.intersperseWith(
          itemBuilder: buildItem,
          separatorBuilder: buildSeparator,
        );

    test('for empty list returns empty', () {
      expect(sut(<int>[]), <int>[]);
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
  });
}
