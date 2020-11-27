import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('zips non-empty lists', () {
    final first = [1, 2, 3];
    final second = ['a', 'b', 'c', 'd'];
    expect(
      first.zipWith(second),
      const [
        Product2(1, 'a'),
        Product2(2, 'b'),
        Product2(3, 'c'),
      ],
    );
  });

  test('zips non-empty list with empty', () {
    final first = [1, 2, 3];
    final second = <int>[];
    expect(first.zipWith(second), <int>[]);
  });

  test('zips empty list with non-empty', () {
    final first = <String>[];
    final second = ['a', 'b', 'c', 'd'];
    expect(first.zipWith(second), <String>[]);
  });
}
