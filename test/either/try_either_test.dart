import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('tryEither', () {
    test('returns right', () {
      final result = tryEither<int>((bind) => int.parse('123'));

      expect(result, const Either<Exception, int>.right(123));
    });

    test('returns left on exception', () {
      final result = tryEither<int>((bind) => int.parse('wrong'));

      expect(result.isLeft(), true);
    });
  });

  group('tryEitherAsync', () {
    test('returns right', () async {
      final result = await tryEitherAsync<int>((bind) => int.parse('123'));

      expect(result, const Either<Exception, int>.right(123));
    });

    test('returns left on exception', () async {
      final result = await tryEitherAsync<int>((bind) => int.parse('wrong'));

      expect(result.isLeft(), true);
    });
  });

  group('toEither', () {
    Future<int> parse(String value) async => int.parse(value);

    test('returns right', () async {
      expect(
        await parse('123').toEither(),
        const Either<Exception, int>.right(123),
      );
    });

    test('returns left on Error', () async {
      expect((await parse('wrong').toEither()).isLeft(), true);
    });
  });
}
