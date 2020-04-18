![](https://github.com/ookami-kb/dfunc/workflows/Dart%20CI/badge.svg)

Functional batteries for Dart programming language.

Provides implementation of Optional, Either and other types + some helper functions.

## Usage

A simple usage example:

```dart
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

  // Optional

  final optional = Optional.of('test');
  optional.isEmpty() == false;
  optional.getOrNull() == 'test';

  // Either

  final Either<Exception, String> either = Either.right('test');
  either.isRight() == true;
  either.map((s) => s.toUpperCase()).right == 'TEST';
}

@sealed
abstract class Base with _$Base {
  const Base._();
}

/// Can be used together with built_value library to create
/// immutable cases.
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ookami-kb/dfunc/issues
