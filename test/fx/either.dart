import 'package:dfunc/src/either/either.dart';
import 'package:dfunc/src/fx/either.dart';
import 'package:test/test.dart';

void main() {
  test('eitherFx', () {
    final results = <int>[];

    eitherFx<Exception, void>((bind) {
      final a = bind<int>(Either.right(1));
      results.add(a);

      final b = bind<String>(Either.left(Exception()));
      results.add(int.parse(b));

      final c = bind<int>(Either.right(3));
      results.add(c);
    });

    expect(results, [1]);
  });

  test('eitherFxAsync', () async {
    final results = <int>[];

    await eitherFxAsync<Exception, void>((bind) async {
      final a = bind<int>(Either.right(1));
      results.add(a);

      final b = bind<int>(Either.left(Exception()));
      results.add(b);

      final c = bind<int>(Either.right(3));
      results.add(c);
    });

    expect(results, [1]);
  });
}
