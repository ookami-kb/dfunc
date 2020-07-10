import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('curries function', () {
    final add = (int a, int b) => a + b;
    final add5 = add.curry()(5);
    expect(add5(10), 15);
  });

  test('uncurries function', () {
    final addCurried = (int a) => (int b) => a + b;
    final add = addCurried.uncurry();
    expect(add(5, 10), 15);
  });
}
