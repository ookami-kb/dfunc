import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('compose parses int and floors', () {
    final floor = (double a) => a.floor();

    final composed = floor.compose(double.parse);
    expect(composed('123.456'), 123);
  });

  test('compose parses int, floors and converts back to string', () {
    final floor = (double a) => a.floor();
    final toString = (dynamic x) => x.toString();
    final composed = toString.compose(floor).compose(double.parse);
    expect(composed('123.456'), '123');
  });
}
