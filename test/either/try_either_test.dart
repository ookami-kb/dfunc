import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('tryEither', () {
    test('returns right', () {
      final result = tryEither(() => int.parse('123'));

      expect(result, const Result<int>.right(123));
    });

    test('returns left on exception', () {
      final result = tryEither(() => int.parse('wrong'));

      expect(result.isLeft(), true);
    });
  });

  group('tryEitherAsync', () {
    test('returns right', () async {
      final result = await tryEitherAsync(() => int.parse('123'));

      expect(result, const Result<int>.right(123));
    });

    test('returns left on exception', () async {
      final result = await tryEitherAsync(() => int.parse('wrong'));

      expect(result.isLeft(), true);
    });
  });

  group('toEither', () {
    Future<int> parse(String value) => Future.value(int.parse(value));

    test('returns right', () async {
      expect(
        await parse('123').toEither(),
        const Result<int>.right(123),
      );
    });

    test('returns left on Error', () async {
      expect((await parse('wrong').toEither()).isLeft(), true);
    });
  });

  group('Result.sequence', () {
    test('returns right', () {
      [
        const Result<int>.right(1),
        const Result<int>.right(2),
        const Result<int>.right(3),
      ].sequence().fold(
            (l) => fail('Expected right, got left: $l'),
            (r) => expect(r, [1, 2, 3]),
          );
    });

    test('returns left on first error', () {
      final exception = Exception('error');

      [
        const Result<int>.right(1),
        Result<int>.left(exception),
        const Result<int>.right(3),
      ].sequence().fold(
            (l) => expect(l, exception),
            (r) => fail('Expected left, got right: $r'),
          );
    });
  });
}
