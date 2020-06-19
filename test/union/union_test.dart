import 'package:dfunc/dfunc.dart';
import 'package:dfunc/src/coproduct/coproduct.dart';
import 'package:test/test.dart';

void main() {
  test('union works', () {
    final union = Coproduct2<String, int>.item1('test');
    final result = union.fold((v) => v.toUpperCase(), (_) => 'error');
    expect(result, 'TEST');
  });
}
