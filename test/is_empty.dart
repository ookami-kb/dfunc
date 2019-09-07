import 'package:dfunc/dfunc.dart' as d;
import 'package:test/test.dart';

void main() {
  test('returns true if string is null', () {
    expect(d.isEmpty(null), true);
  });

  test('returns true if string is empty', () {
    expect(d.isEmpty(''), true);
  });

  test('returns false if string is not null and not empty', () {
    expect(d.isEmpty('string'), false);
  });
}
