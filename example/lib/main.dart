import 'package:dfunc/dfunc.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Either

  const either = Either<Exception, String>.right('test');
  // ignore: unnecessary_statements
  either.isRight() == true;
  // ignore: unnecessary_statements
  either.map((s) => s.toUpperCase()).fold(always(null), identity) == 'TEST';
}
