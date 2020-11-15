import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('Scope functions', () {
    test('let', () {
      final result = 3.let((it) => it + 2);
      expect(result, 5);
    });

    test('let with null', () {
      final int a = null;
      final result = a?.let((it) => it + 2);
      expect(result, null);
    });

    test('also', () {
      var x = 0;
      final result = 3.also((it) => x += 5);
      expect(result, 3);
      expect(x, 5);
    });
  });
}
