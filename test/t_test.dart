import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('returns true if called without argument', () {
    expect(T(), true);
  });

  test('returns true if called with argument', () {
    expect(T(false), true);
  });
}
