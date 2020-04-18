import 'package:built_value/built_value.dart';
import 'package:dfunc/dfunc.dart';

part 'main.g.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Sealed classes generation:

  final Base item = Item1((b) => b..text = 'TEST');
  item.match((item) => print(item.text), (_) => print('2')); // prints TEST

  final State state = State2();
  state.match(
    (_) => print('1'),
    (_) => print('2'),
    (_) => print('3'),
  ); // prints 2
}

@sealed
abstract class Base with _$Base {
  const Base._();
}

abstract class Item1 with _$Base implements Built<Item1, Item1Builder>, Base {
  factory Item1([Function(Item1Builder b) updates]) = _$Item1;

  Item1._();

  String get text;
}

class Item2 extends Base {
  const Item2() : super._();
}

@sealed
abstract class State with _$State {
  const State._();
}

class State1 extends State {
  const State1() : super._();
}

class State2 extends State {
  const State2() : super._();
}

class State3 extends State {
  const State3() : super._();
}
