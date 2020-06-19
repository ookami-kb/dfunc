import 'package:built_value/built_value.dart';
import 'package:dfunc/dfunc.dart';

part 'main.g.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Sealed classes generation:

  final item = Base.item1((b) => b..text = 'TEST');
  item.fold((item) => print(item.text), (_) => print('2')); // prints TEST

  final state = State.state2();
  state.fold(
    (_) => print('1'),
    (_) => print('2'),
    (_) => print('3'),
  ); // prints 2

  // Optional

  final optional = Optional.of('test');
  optional.isEmpty() == false;
  optional.getOrNull() == 'test';

  // Either

  final either = Either<Exception, String>.right('test');
  either.isRight() == true;
  either.map((s) => s.toUpperCase()).right == 'TEST';
}

class Base extends Coproduct2<Item1, Item2> {
  Base.item1([Function(Item1Builder b) updates]) : super.item1(Item1(updates));

  const Base.item2() : super.item2(const Item2());
}

/// Can be used together with built_value library to create
/// immutable cases.
abstract class Item1 implements Built<Item1, Item1Builder> {
  factory Item1([Function(Item1Builder b) updates]) = _$Item1;

  Item1._();

  String get text;
}

class Item2 {
  const Item2();
}

class State extends Coproduct3<State1, State2, State3> {
  const State.state1() : super.item1(const State1());

  const State.state2() : super.item2(const State2());

  const State.state3() : super.item3(const State3());
}

class State1 {
  const State1();
}

class State2 {
  const State2();
}

class State3 {
  const State3();
}
