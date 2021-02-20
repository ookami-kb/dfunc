import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('maybeMap for null', () {
    const String? x = null;
    expect(x.maybeMap((e) => e.toUpperCase()), null);
  });

  test('maybeMap for some', () {
    const String? x = 'a';
    expect(x.maybeMap((e) => e.toUpperCase()), 'A');
  });

  test('maybeFlatMap for null returning null', () {
    const String? x = null;
    expect(x.maybeFlatMap<String>((_) => null), null);
  });

  test('maybeFlatMap for null returning some', () {
    const String? x = null;
    expect(x.maybeFlatMap((e) => e.toUpperCase()), null);
  });

  test('maybeFlatMap for some returning null', () {
    const String? x = 'a';
    expect(x.maybeFlatMap<String>((_) => null), null);
  });

  test('maybeFlatMap for some returning some', () {
    const String? x = 'a';
    expect(x.maybeFlatMap((e) => e.toUpperCase()), 'A');
  });

  test('maybeWhere for some with false predicate', () {
    const String? x = 'a';
    expect(x.maybeWhere((e) => e.isEmpty), null);
  });

  test('maybeWhere for some with true predicate', () {
    const String? x = 'a';
    expect(x.maybeWhere((e) => e.isNotEmpty), 'a');
  });

  test('maybeWhere for non-null with false predicate', () {
    const String x = 'a';
    expect(x.maybeWhere((e) => e.isEmpty), null);
  });

  test('maybeWhere for non-null with true predicate', () {
    const String x = 'a';
    expect(x.maybeWhere((e) => e.isNotEmpty), 'a');
  });
}
