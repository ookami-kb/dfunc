import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('partial application works', () {
    final add = (int a, int b) => a + b;
    final add5 = add.partial1(5);
    expect(add5(10), 15);
  });
}
