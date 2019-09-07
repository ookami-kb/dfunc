import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('returns empty string if passed null', () {
    expect(substring(1, 4, null), '');
  });

  test('returns proper substring for range within the bounds', () {
    expect(substring(1, 4, 'dartlang'), 'art');
  });

  test('returns proper substring for range out of the bounds', () {
    expect(substring(1, 40, 'dartlang'), 'artlang');
  });
}
