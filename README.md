![](https://github.com/ookami-kb/dfunc/workflows/Dart%20CI/badge.svg)
[![Pub Version](https://img.shields.io/pub/v/dfunc)](https://pub.dev/packages/dfunc)

Functional batteries for Dart programming language.

Provides implementation of Optional, Either and other types + some helper functions.

## Usage

A simple usage example:

```dart
import 'package:dfunc/dfunc.dart';

void main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');

  // Either

  final either = Either<Exception, String>.right('test');
  either.isRight() == true;
  either.map((s) => s.toUpperCase()).fold(always(null), identity) == 'TEST';
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/ookami-kb/dfunc/issues).
