import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('returns empty string if passed null', () {
    expect(substring(null, 1, 4), '');
  });

  test('returns proper substring for range within the bounds', () {
    expect(substring('dartlang', 1, 4), 'art');
  });

  test('returns proper substring for range out of the bounds', () {
    expect(substring('dartlang', 1, 40), 'artlang');
  });

  test('returns proper substring with omitted endIndex', () {
    expect(substring('dartlang', 1), 'artlang');
  });
}
