import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('creates left Either', () {
    final either = Either.left('Test');
    expect(either.isLeft(), true);
    expect(either.isRight(), false);
  });

  test('creates right Either', () {
    final either = Either.right('Test');
    expect(either.isLeft(), false);
    expect(either.isRight(), true);
  });

  test('folds Left correctly', () {
    final either = Either.left('Test');
    expect(either.fold(T, F), true);
  });

  test('folds Right correctly', () {
    final either = Either.right('Test');
    expect(either.fold(F, T), true);
  });

  test('maps Either correctly', () {
    final either = Either.right('123').map(int.parse);
    expect(either.fold(always(0), identity), 123);
  });

  test('maps async Either correctly', () async {
    final either = Either.right('123').mapAsync(int.parse);
    final result = await either;
    expect(result.fold(always(0), identity), 123);
  });

  test('flatMaps Either correctly', () {
    final either =
        Either.right('123').flatMap((v) => Either.right(int.parse(v)));
    expect(either.fold(always(0), identity), 123);
  });

  test('flatMaps async Either correctly', () async {
    final either = await Either<Exception, String>.right('123')
        .flatMapAsync((v) => Either.right(int.parse(v)));
    expect(either.fold(always(0), identity), 123);
  });

  test('converts Either<Future> to Future<Either>', () async {
    final either1 =
        Either<Exception, Future<String>>.right(Future.value('Test'));
    final either2 = await either1.wait();
    expect(either2.fold(always(0), identity), 'Test');
  });

  test('folds Future<Either>', () async {
    final either = Future.value(Either.right('Test'));
    final value = await either.foldAsync(F, T);
    expect(value, true);
  });

  test('folds Future<Either> with async mappers', () async {
    final either = Future.value(Either.right('Test'));
    final value = await either.foldAsync((_) async => false, (_) async => true);
    expect(value, true);
  });

  test('maps Future<Either>', () async {
    final either = Future.value(Either.right('123'));
    final value = await either.mapAsync(int.parse);
    expect(value.fold(always(0), identity), 123);
  });

  test('maps Future<Either> with async mapper', () async {
    final either = Future.value(Either.right('123'));
    final value = await either.mapAsync((x) async => int.parse(x));
    expect(value.fold(always(0), identity), 123);
  });

  test('flatMaps Future<Either> with async mapper', () async {
    final either = Future.value(Either.right('123'));
    final value =
        await either.flatMapAsync((x) async => Either.right(int.parse(x)));
    expect(value.fold(always(0), identity), 123);
  });

  test('joins Future<Either>', () async {
    final either = Future<Either<bool, bool>>.value(Either.right(true));
    final value = await either.join();
    expect(value, true);
  });

  group('combines 2 eithers', () {
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
