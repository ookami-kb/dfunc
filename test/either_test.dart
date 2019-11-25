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

  test('flatMaps Either correctly', () {
    final either =
        Either.right('123').flatMap((v) => Either.right(int.parse(v)));
    expect(123, either.right);
    expect(null, either.left);
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
}
