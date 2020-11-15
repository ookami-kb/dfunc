import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('Either', () {
    test('Either::left', () {
      final either = Either.left('Test');
      expect(either.isLeft(), true);
      expect(either.isRight(), false);
    });

    test('Either::right', () {
      final either = Either.right('Test');
      expect(either.isLeft(), false);
      expect(either.isRight(), true);
    });

    test('Left::fold', () {
      final either = Either.left('Test');
      expect(either.fold(T, F), true);
    });

    test('Right::fold', () {
      final either = Either.right('Test');
      expect(either.fold(F, T), true);
    });

    test('Either::map for Right', () {
      final either = Either.right('123').map(int.parse);
      expect(either.fold(always(0), identity), 123);
    });

    test('Either::map for Left', () {
      final either = Either<int, String>.left(0).map(int.parse);
      expect(either.isLeft(), true);
    });
  });

  group('EitherAsync', () {
    test('Either::mapAsync', () async {
      final either = Either.right('123').mapAsync(int.parse);
      final result = await either;
      expect(result.fold(always(0), identity), 123);
    });

    test('Either::mapLeftAsync', () async {
      final either = Either.left('123').mapLeftAsync(int.parse);
      final result = await either;
      expect(result.fold(identity, always(0)), 123);
    });

    test('Either::flatMap', () {
      final either =
          Either.right('123').flatMap((v) => Either.right(int.parse(v)));
      expect(either.fold(always(0), identity), 123);
    });

    test('Either::flatMapAsync', () async {
      final either = await Either<Exception, String>.right('123')
          .flatMapAsync((v) => Either.right(int.parse(v)));
      expect(either.fold(always(0), identity), 123);
    });
  });

  group('EitherFutureExtension', () {
    test('Either<Future>::wait converts to Future<Either>', () async {
      final either1 =
          Either<Exception, Future<String>>.right(Future.value('Test'));
      final either2 = await either1.wait();
      expect(either2.fold(always(0), identity), 'Test');
    });
  });

  group('FutureEitherExtension', () {
    test('Future<Either>::foldAsync with sync mapper', () async {
      final either = Future.value(Either.right('Test'));
      final value = await either.foldAsync(F, T);
      expect(value, true);
    });

    test('Future<Either>::foldAsync with async mappers', () async {
      final either = Future.value(Either.right('Test'));
      final value =
          await either.foldAsync((_) async => false, (_) async => true);
      expect(value, true);
    });

    test('Future<Either>::mapAsync with sync mapper', () async {
      final either = Future.value(Either.right('123'));
      final value = await either.mapAsync(int.parse);
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::mapAsync with async mapper', () async {
      final either = Future.value(Either.right('123'));
      final value = await either.mapAsync((x) async => int.parse(x));
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::mapLeftAsync with sync mapper', () async {
      final either = Future.value(Either.left('123'));
      final value = await either.mapLeftAsync(int.parse);
      expect(value.fold(identity, always(0)), 123);
    });

    test('Future<Either>::mapLeftAsync with async mapper', () async {
      final either = Future.value(Either.left('123'));
      final value = await either.mapLeftAsync((x) async => int.parse(x));
      expect(value.fold(identity, always(0)), 123);
    });

    test('Future<Either>::flatMapAsync with async mapper', () async {
      final either = Future.value(Either.right('123'));
      final value =
          await either.flatMapAsync((x) async => Either.right(int.parse(x)));
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::join', () async {
      final either = Future<Either<bool, bool>>.value(Either.right(true));
      final value = await either.join();
      expect(value, true);
    });
  });

  group('Either::combine', () {
    test('returns left if first is left', () {
      final e1 = Either<String, int>.left('left');
      final e2 = Either<String, double>.right(1.0);
      final result = e1.combine(e2);

      expect(result.fold(identity, always('')), 'left');
    });

    test('returns left if second is left', () {
      final e1 = Either<String, int>.right(1);
      final e2 = Either<String, double>.left('left');
      final result = e1.combine(e2);

      expect(result.fold(identity, always('')), 'left');
    });

    test('returns right if both are right', () {
      final e1 = Either<String, int>.right(1);
      final e2 = Either<String, double>.right(1.0);
      final result = e1.combine(e2);

      expect(result.fold(always(null), identity), Product2(1, 1.0));
    });
  });
}
