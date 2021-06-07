import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('StringExt', () {
    test('ifEmpty returns result of f if string is empty', () {
      expect(''.ifEmpty(() => 'fallback'), 'fallback');
    });

    test('ifEmpty returns string if it is not empty', () {
      expect('value'.ifEmpty(() => 'fallback'), 'value');
    });
  });

  group('NullableStringExt', () {
    test('orEmpty returns empty string if string is null', () {
      expect(null.orEmpty(), '');
    });

    test('orEmpty returns string if it is not null', () {
      expect('value'.orEmpty(), 'value');
    });
  });
}
