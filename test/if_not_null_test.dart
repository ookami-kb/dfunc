import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('ifNotNull returns null if passed arg is null', () {
    expect(ifNotNull((_) => 'Not null', null), null);
  });

  test('ifNotNull returns result of function if passed arg is not null', () {
    expect(ifNotNull((x) => 'Not null: $x', '1'), 'Not null: 1');
  });
}
