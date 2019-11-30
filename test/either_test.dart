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
    expect(123, either.right);
    expect(null, either.left);
  });

  test('maps async Either correctly', () async {
    final either = Either.right('123').mapAsync(int.parse);
    expect(123, (await either).right);
    expect(null, (await either).left);
  });

  test('flatMaps Either correctly', () {
    final either =
        Either.right('123').flatMap((v) => Either.right(int.parse(v)));
    expect(123, either.right);
    expect(null, either.left);
  });

  test('flatMaps async Either correctly', () async {
    final either =
        Either.right('123').flatMapAsync((v) => Either.right(int.parse(v)));
    expect(123, (await either).right);
    expect(null, (await either).left);
  });

  test('converts Either<Future> to Future<Either>', () async {
    final Either<Exception, Future<String>> either1 =
        Either.right(Future.value('Test'));
    final Either<Exception, String> either2 = await either1.wait();
    expect(either2.right, 'Test');
  });

  test('folds Future<Either>', () async {
    final either = Future.value(Either.right('Test'));
    final value = await either.fold(F, T);
    expect(value, true);
  });

  test('folds Future<Either> with async mappers', () async {
    final either = Future.value(Either.right('Test'));
    final value = await either.fold((_) async => false, (_) async => true);
    expect(value, true);
  });

  test('maps Future<Either>', () async {
    final either = Future.value(Either.right('123'));
    final value = await either.map(int.parse);
    expect(value.right, 123);
  });

  test('maps Future<Either> with async mapper', () async {
    final either = Future.value(Either.right('123'));
    final value = await either.map((x) async => int.parse(x));
    expect(value.right, 123);
  });

  test('flatMaps Future<Either> with async mapper', () async {
    final either = Future.value(Either.right('123'));
    final value = await either.flatMap((x) async => Either.right(int.parse(x)));
    expect(value.right, 123);
  });

  test('joins Future<Either>', () async {
    final Future<Either<bool, bool>> either = Future.value(Either.right(true));
    final value = await either.join();
    expect(value, true);
  });
}
