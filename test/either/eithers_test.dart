import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('combines 5 right eithers correctly', () {
    const e1 = Either<String, int>.right(1);
    const e2 = Either<String, int>.right(2);
    const e3 = Either<String, int>.right(3);
    const e4 = Either<String, int>.right(4);
    const e5 = Either<String, int>.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.fold(always(null), identity), const Product5(1, 2, 3, 4, 5));
  });

  test('combines 5 eithers with 1 left correctly', () {
    const e1 = Either<String, int>.right(1);
    const e2 = Either<String, int>.right(2);
    const e3 = Either<String, int>.right(3);
    const e4 = Either<String, int>.left('error');
    const e5 = Either<String, int>.right(5);
    final result = Eithers.combine5(e1, e2, e3, e4, e5);
    expect(result.fold(identity, always('')), 'error');
  });
}
