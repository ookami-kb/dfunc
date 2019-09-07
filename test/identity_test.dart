import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('identity returns same element', () {
    expect(identity('Test'), 'Test');
  });
}
