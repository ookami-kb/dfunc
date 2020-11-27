import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('coproduct works', () {
    const union = Coproduct2<String, int>.item1('test');
    final result = union.fold((v) => v.toUpperCase(), (_) => 'error');
    expect(result, 'TEST');
  });

  test('same coproducts are equal', () {
    const union1 = Coproduct2<String, int>.item1('test');
    const union2 = Coproduct2<String, int>.item1('test');
    expect(union1 == union2, true);
  });

  test('different coproducts are not equal', () {
    const union1 = Coproduct2<String, int>.item1('test');
    const union2 = Coproduct2<String, int>.item2(1);
    expect(union1 == union2, false);
  });
}
