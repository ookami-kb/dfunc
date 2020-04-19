import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('ifNotNull returns null if passed arg is null', () {
    expect(ifNotNull((_) => 'Not null', null), null);
  });

  test('ifNotNull returns result of function if passed arg is not null', () {
    expect(ifNotNull((x) => 'Not null: $x', '1'), 'Not null: 1');
  });

  test('extension ifNotNull returns null if this is null', () {
    expect(null.ifNotNull((_) => 'Not null'), null);
  });

  test('extension ifNotNull returns result if this is not null', () {
    expect('1'.ifNotNull((x) => 'Not null: $x'), 'Not null: 1');
  });
}
