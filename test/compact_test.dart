import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('Removes null values from list', () {
    final list = [1, 2, null, 3];
    expect(list.compact(), [1, 2, 3]);
  });
}
