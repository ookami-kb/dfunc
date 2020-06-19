import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('zips non-empty lists', () {
    final first = [1, 2, 3];
    final second = ['a', 'b', 'c', 'd'];
    expect(
      first.zipWith(second),
      [
        Product2(1, 'a'),
        Product2(2, 'b'),
        Product2(3, 'c'),
      ],
    );
  });

  test('zips non-empty list with empty', () {
    final first = [1, 2, 3];
    final second = [];
    expect(first.zipWith(second), []);
  });

  test('zips empty list with non-empty', () {
    final first = [];
    final second = ['a', 'b', 'c', 'd'];
    expect(first.zipWith(second), []);
  });
}
