import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('complement function works correctly', () {
    final bool Function(String) isNotEmpty = complement((s) => s.isEmpty);
    expect(isNotEmpty('Test'), true);
    expect(isNotEmpty(''), false);
  });
}
