import 'package:dfunc/src/limit.dart';
import 'package:test/test.dart';

void main() {
  final limit3 = limit(3);
  test('returns empty string if passed null', () {
    expect(limit3(null), '');
  });

  test('returns passed string if it is shorter than limit', () {
    expect(limit3('OK'), 'OK');
  });

  test('returns limited string', () {
    expect(limit3('Test'), 'Tes');
  });
}
