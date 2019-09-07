import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  final t = always('Test');
  test('returns value if called without argument', () {
    expect(t(), 'Test');
  });

  test('returns value if called with argument', () {
    expect(t(true), 'Test');
  });
}
