import 'package:dfunc/dfunc.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Either

  final either = Either<Exception, String>.right('test');
  either.isRight() == true;
  either.map((s) => s.toUpperCase()).fold(always(null), identity) == 'TEST';
}
