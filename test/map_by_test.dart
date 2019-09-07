import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('mapBy returns map with keys as a result of function', () {
    expect(mapBy(int.parse, ['1', '2', '3']), {1: '1', 2: '2', 3: '3'});
  });
}
