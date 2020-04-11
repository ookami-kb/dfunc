import 'package:dfunc/dfunc.dart';
import 'package:dfunc/src/coproduct/coproduct.dart';
import 'package:dfunc/src/coproduct/union.dart';
import 'package:test/test.dart';

void main() {
  test('union works', () {
    final Union2<String, int> union = Union2.first('test');
    final result = union.match((v) => v.toUpperCase(), (_) => 'error');
    expect(result, 'TEST');
  });

  test('extending union type works', () {
    final value = _Test.value(10);
    final result = value.match(identity, (v) => v.toString());
    expect(result, '10');
  });
}

class _Test implements Coproduct2<String, int> {
  _Test._(this._value);

  final Union2<String, int> _value;

  static _Test error(String value) => _Test._(Union2.first(value));

  static _Test value(int value) => _Test._(Union2.second(value));

  @override
  R match<R>(R Function(String) ifFirst, R Function(int) ifSecond) =>
      _value.match(ifFirst, ifSecond);
}
