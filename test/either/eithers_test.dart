import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('combines 5 right eithers correctly', () {
    final Either<String, int> e1 = Either.right(1);
    final Either<String, int> e2 = Either.right(2);
    final Either<String, int> e3 = Either.right(3);
    final Either<String, int> e4 = Either.right(4);
    final Either<String, int> e5 = Either.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.right, Tuple5(1, 2, 3, 4, 5));
  });

  test('combines 5 eithers with 1 left correctly', () {
    final Either<String, int> e1 = Either.right(1);
    final Either<String, int> e2 = Either.right(2);
    final Either<String, int> e3 = Either.right(3);
    final Either<String, int> e4 = Either.left('error');
    final Either<String, int> e5 = Either.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.left, 'error');
  });
}
