import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('Either', () {
    test('Either::left', () {
      const either = Either<String, int>.left('Test');
      expect(either.isLeft(), true);
      expect(either.isRight(), false);
    });

    test('Either::right', () {
      const either = Either<int, String>.right('Test');
      expect(either.isLeft(), false);
      expect(either.isRight(), true);
    });

    test('Left::fold', () {
      const either = Either<String, int>.left('Test');
      expect(either.fold(T, F), true);
    });

    test('Right::fold', () {
      const either = Either<int, String>.right('Test');
      expect(either.fold(F, T), true);
    });

    test('Either::map for Right', () {
      final either = const Either<int, String>.right('123').map(int.parse);
      expect(either.fold(always(0), identity), 123);
    });

    test('Either::map for Left', () {
      final either = const Either<int, String>.left(0).map(int.parse);
      expect(either.isLeft(), true);
    });
  });

  group('DoEither', () {
    test('doOnLeft is triggered on left', () {
      int x = 0;
      const v = Either<int, String>.left(0);
      // ignore: cascade_invocations
      v.doOnLeft((_) => x = 1);
      expect(x, 1);
    });

    test('doOnLeft is not triggered on right', () {
      int x = 0;
      const v = Either<int, String>.right('');
      // ignore: cascade_invocations
      v.doOnLeft((_) => x = 1);
      expect(x, 0);
    });

    test('doOnRight is triggered on right', () {
      int x = 0;
      const v = Either<int, String>.right('');
      // ignore: cascade_invocations
      v.doOnRight((_) => x = 1);
      expect(x, 1);
    });

    test('doOnRight is not triggered on left', () {
      int x = 0;
      const v = Either<int, String>.left(0);
      // ignore: cascade_invocations
      v.doOnRight((_) => x = 1);
      expect(x, 0);
    });
  });

  group('EitherAsync', () {
    test('Either::mapAsync', () async {
      final either = const Either<int, String>.right('123').mapAsync(int.parse);
      final result = await either;
      expect(result.fold(always(0), identity), 123);
    });

    test('Either::mapLeftAsync', () async {
      final either =
          const Either<String, int>.left('123').mapLeftAsync(int.parse);
      final result = await either;
      expect(result.fold(identity, always(0)), 123);
    });

    test('Either::flatMap', () {
      final either = const Either<int, String>.right('123')
          .flatMap((v) => Either.right(int.parse(v)));
      expect(either.fold(always(0), identity), 123);
    });

    test('Either::flatMapAsync', () async {
      final either = await const Either<Exception, String>.right('123')
          .flatMapAsync((v) => Either.right(int.parse(v)));
      expect(either.fold(always(0), identity), 123);
    });

    test('Either::flatMapLeftAsync', () async {
      final either = await Either<Exception, String>.left(Exception())
          .flatMapLeftAsync(
              (e) async => const Either<String, String>.left('Error'));
      expect(either.fold(identity, (_) => throw Error()), 'Error');
    });

    test('doOnLeftAsync is triggered on left', () async {
      int x = 0;
      const v = Either<int, String>.left(0);
      // ignore: cascade_invocations
      await v.doOnLeftAsync((_) => x = 1);
      expect(x, 1);
    });

    test('doOnLeftAsync is not triggered on right', () async {
      int x = 0;
      const v = Either<int, String>.right('');
      // ignore: cascade_invocations
      await v.doOnLeftAsync((_) => x = 1);
      expect(x, 0);
    });

    test('doOnRightAsync is triggered on right', () async {
      int x = 0;
      const v = Either<int, String>.right('');
      // ignore: cascade_invocations
      await v.doOnRightAsync((_) => x = 1);
      expect(x, 1);
    });

    test('doOnRightAsync is not triggered on left', () async {
      int x = 0;
      const v = Either<int, String>.left(0);
      // ignore: cascade_invocations
      await v.doOnRightAsync((_) => x = 1);
      expect(x, 0);
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
      final either = Future.value(const Either<int, String>.right('Test'));
      final value = await either.foldAsync(F, T);
      expect(value, true);
    });

    test('Future<Either>::foldAsync with async mappers', () async {
      final either = Future.value(const Either<int, String>.right('Test'));
      final value =
          await either.foldAsync((_) async => false, (_) async => true);
      expect(value, true);
    });

    test('Future<Either>::mapAsync with sync mapper', () async {
      final either = Future.value(const Either<int, String>.right('123'));
      final value = await either.mapAsync(int.parse);
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::mapAsync with async mapper', () async {
      final either = Future.value(const Either<int, String>.right('123'));
      final value = await either.mapAsync((x) async => int.parse(x));
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::mapLeftAsync with sync mapper', () async {
      final either = Future.value(const Either<String, int>.left('123'));
      final value = await either.mapLeftAsync(int.parse);
      expect(value.fold(identity, always(0)), 123);
    });

    test('Future<Either>::mapLeftAsync with async mapper', () async {
      final either = Future.value(const Either<String, int>.left('123'));
      final value = await either.mapLeftAsync((x) async => int.parse(x));
      expect(value.fold(identity, always(0)), 123);
    });

    test('Future<Either>::flatMapAsync with async mapper', () async {
      final either = Future.value(const Either<int, String>.right('123'));
      final value =
          await either.flatMapAsync((x) async => Either.right(int.parse(x)));
      expect(value.fold(always(0), identity), 123);
    });

    test('Future<Either>::flatMapLeftAsync with sync mapper', () async {
      final either = Future.value(const Either<String, int>.left('123'));
      final value =
          await either.flatMapLeftAsync((x) => Either.left(int.parse(x)));
      expect(value.fold(identity, always(0)), 123);
    });

    test('Future<Either>::join', () async {
      final either = Future<Either<bool, bool>>.value(const Either.right(true));
      final value = await either.join();
      expect(value, true);
    });

    test('doOnLeftAsync is triggered on left', () async {
      int x = 0;
      final v = Future<Either<int, String>>.value(const Either.left(0));
      // ignore: cascade_invocations
      await v.doOnLeftAsync((_) => x = 1);
      expect(x, 1);
    });

    test('doOnLeftAsync is not triggered on right', () async {
      int x = 0;
      final v = Future<Either<int, String>>.value(const Either.right(''));
      // ignore: cascade_invocations
      await v.doOnLeftAsync((_) => x = 1);
      expect(x, 0);
    });

    test('doOnRightAsync is triggered on right', () async {
      int x = 0;
      final v = Future<Either<int, String>>.value(const Either.right(''));
      // ignore: cascade_invocations
      await v.doOnRightAsync((_) => x = 1);
      expect(x, 1);
    });

    test('doOnRightAsync is not triggered on left', () async {
      int x = 0;
      final v = Future<Either<int, String>>.value(const Either.left(0));
      // ignore: cascade_invocations
      await v.doOnRightAsync((_) => x = 1);
      expect(x, 0);
    });
  });

  group('Either::combine', () {
    test('returns left if first is left', () {
      const e1 = Either<String, int>.left('left');
      const e2 = Either<String, double>.right(1);
      final result = e1.combine(e2);

      expect(result.fold(identity, always('')), 'left');
    });

    test('returns left if second is left', () {
      const e1 = Either<String, int>.right(1);
      const e2 = Either<String, double>.left('left');
      final result = e1.combine(e2);

      expect(result.fold(identity, always('')), 'left');
    });

    test('returns right if both are right', () {
      const e1 = Either<String, int>.right(1);
      const e2 = Either<String, double>.right(1);
      final result = e1.combine(e2);

      expect(result.fold(always(null), identity), const Product2(1, 1));
    });
  });

  group('Shortcuts', () {
    test('creates left', () {
      final Either<int, String> value = left(0);
      expect(value, const Either<int, String>.left(0));
    });

    test('creates right', () {
      final Either<int, String> value = right('right');
      expect(value, const Either<int, String>.right('right'));
    });
  });
}
