import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('combines 5 right eithers correctly', () {
    final e1 = Either<String, int>.right(1);
    final e2 = Either<String, int>.right(2);
    final e3 = Either<String, int>.right(3);
    final e4 = Either<String, int>.right(4);
    final e5 = Either<String, int>.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.fold(always(null), identity), Product5(1, 2, 3, 4, 5));
  });

  test('combines 5 eithers with 1 left correctly', () {
    final e1 = Either<String, int>.right(1);
    final e2 = Either<String, int>.right(2);
    final e3 = Either<String, int>.right(3);
    final e4 = Either<String, int>.left('error');
    final e5 = Either<String, int>.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.fold(identity, always('')), 'error');
  });
}
