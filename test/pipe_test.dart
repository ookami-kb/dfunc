import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart' hide Func1;

void main() {
  group('pipe2', () {
    test('pipe2 parses int and floors', () {
      final pipe = pipe2(double.parse, (double v) => v.floor());
      expect(pipe('123.456'), 123);
    });

    test('pipe2 maps list of strings to list of ints and calculates sum', () {
      final Func1<Iterable<String>, int> pipe = pipe2(map(int.parse), sum);
      expect(pipe(['1', '2', '3']), 6);
    });
  });

  group('pipe3', () {
    test('pipe parses int and floors and converts back to string', () {
      final pipe = double.parse
          .pipe((double v) => v.floor())
          .pipe((int v) => v.toString());
      expect(pipe('123.456'), '123');
    });

    test(
        'pipe maps list of strings to list of doubles, '
        'floors them and calculates sum', () {
      final pipe =
          map(double.parse).pipe(map((double x) => x.floor())).pipe(sum);
      expect(pipe(['1.2', '2.3', '3.4']), 6);
    });
  });
}
