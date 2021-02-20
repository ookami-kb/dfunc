import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
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
}
