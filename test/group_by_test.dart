import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('extension groupBy returns correct map', () {
    final Iterable<String> list = ['1', '2', '3', '4', '3'];
    expect(list.groupBy(int.parse), {
      1: ['1'],
      2: ['2'],
      3: ['3', '3'],
      4: ['4'],
    });
  });

  test('extension groupBy returns empty map for empty iterable', () {
    final Iterable<String> list = [];
    expect(list.groupBy(int.parse), <int, List<String>>{});
  });
}
