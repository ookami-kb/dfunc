import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('maps elements with index', () {
    final items = ['a', 'b', 'c'];
    expect(mapIndexed((i, e) => '$e$i', items), ['a0', 'b1', 'c2']);
  });

  test('extension maps elements with index', () {
    final items = ['a', 'b', 'c'];
    expect(items.mapIndexed((i, e) => '$e$i'), ['a0', 'b1', 'c2']);
  });
}
