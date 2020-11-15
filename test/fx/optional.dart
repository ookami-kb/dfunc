import 'package:dfunc/src/fx/optional.dart';
import 'package:dfunc/src/optional/optional.dart';
import 'package:test/test.dart';

void main() {
  test('optionalFx', () {
    final results = <int>[];

    optionalFx<void>((bind) {
      final a = bind<int>(Optional.some(1));
      results.add(a);

      final b = bind<int>(Optional.empty());
      results.add(b);

      final c = bind<int>(Optional.some(3));
      results.add(c);
    });

    expect(results, [1]);
  });

  test('optionalFxAsync', () async {
    final results = <int>[];

    await optionalFxAsync<void>((bind) async {
      final a = bind<int>(Optional.some(1));
      results.add(a);

      final b = bind<int>(Optional.empty());
      results.add(b);

      final c = bind<int>(Optional.some(3));
      results.add(c);
    });

    expect(results, [1]);
  });
}
