import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('sum', () {
    test('sum of empty list equals 0', () {
      expect(sum([]), 0);
    });

    test('sum of 1-element list equals element', () {
      expect(sum([10]), 10);
    });

    test('sum of list equals sum of elements', () {
      expect(sum([10, 20, 30]), 60);
    });
  });
}
