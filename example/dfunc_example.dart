import 'package:dfunc/dfunc.dart';

main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');
}
