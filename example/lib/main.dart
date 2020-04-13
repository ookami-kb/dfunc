import 'package:dfunc/dfunc.dart';

part 'main.g.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Sealed classes generation:

  final Base item = Item1();
  item.match((_) => print('1'), (_) => print('2')); // prints 1

  final State state = State2();
  state.match(
    (_) => print('1'),
    (_) => print('2'),
    (_) => print('3'),
  ); // prints 2
}

@Sealed()
abstract class Base with SealedBase {}

class Item1 extends Base {}

class Item2 extends Base {}

@Sealed()
abstract class State with SealedState {}

class State1 extends State {}

class State2 extends State {}

class State3 extends State {}
