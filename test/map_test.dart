import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('creates a correct mapper', () {
    final Mapper<String, int> mapper = map(int.parse);
    expect(mapper(['1', '2']), [1, 2]);
  });
}
