import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('returns false if called without argument', () {
    expect(F(), false);
  });

  test('returns false if called with argument', () {
    expect(F(true), false);
  });
}
