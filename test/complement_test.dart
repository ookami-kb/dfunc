import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('complement function works correctly', () {
    bool Function(String) isNotEmpty = complement((s) => s.isEmpty);
    expect(isNotEmpty('Test'), true);
    expect(isNotEmpty(''), false);
  });
}
