// ignore_for_file: avoid-duplicate-test-assertions, avoid-duplicate-collection-elements

import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('memoize', () {
    int counter = 0;

    final memoized = memoize((int arg) {
      counter++;

      return arg * 2;
    });

    expect(memoized(1), 2);
    expect(counter, 1);

    // Doesn't call the function again.
    expect(memoized(1), 2);
    expect(counter, 1);

    // Calls the function for a different argument.
    expect(memoized(2), 4);
    expect(counter, 2);

    // Doesn't call the function again.
    expect(memoized(1), 2);
    expect(counter, 2);
  });

  test('memoize with limited capacity', () {
    int counter = 0;

    final memoized = memoize(capacity: 1, (int arg) {
      counter++;

      return arg * 2;
    });

    expect(memoized(1), 2);
    expect(counter, 1);

    // Doesn't call the function again.
    expect(memoized(1), 2);
    expect(counter, 1);

    // Calls the function for a different argument.
    expect(memoized(2), 4);
    expect(counter, 2);

    // Calls the function again if capacity exceeded.
    expect(memoized(1), 2);
    expect(counter, 3);
  });

  test('memoize async', () async {
    int counter = 0;

    final memoized = memoize((int arg) async {
      await Future<void>.delayed(Duration.zero);
      counter++;

      return arg * 2;
    });

    expect(await memoized(1), 2);
    expect(counter, 1);

    // Doesn't call the function again.
    expect(await memoized(1), 2);
    expect(counter, 1);

    // Calls the function one time for a different argument.
    expect(
      await Future.wait([memoized(2), memoized(2), memoized(2)]),
      [4, 4, 4],
    );
    expect(counter, 2);
  });
}
