import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group('pipe2', () {
    test('pipe parses int and floors', () {
      final pipe = pipe2(double.parse, (double v) => v.floor());
      expect(pipe('123.456'), 123);
    });

    test('pipe maps list of strings to list of ints and calculates sum', () {
      final Pipe<Iterable<String>, int> pipe = pipe2(map(int.parse), sum);
      expect(pipe(['1', '2', '3']), 6);
    });
  });

  group('pipe3', () {
    test('pipe parses int and floors and converts back to string', () {
      final pipe = pipe3(
        double.parse,
        (double v) => v.floor(),
        (int v) => v.toString(),
      );
      expect(pipe('123.456'), '123');
    });

    test(
        'pipe maps list of strings to list of doubles, '
        'floors them and calculates sum', () {
      final Pipe<Iterable<String>, int> pipe = pipe3(
        map(double.parse),
        map((double x) => x.floor()),
        sum,
      );
      expect(pipe(['1.2', '2.3', '3.4']), 6);
    });
  });
}
