![](https://github.com/ookami-kb/dfunc/workflows/Dart%20CI/badge.svg)

Functional batteries for Dart programming language.

Heavily inspired by such libraries as `ramda.js` and `lodash`.

## Usage

A simple usage example:

```dart
import 'package:dfunc/dfunc.dart';

main() {
  final items = ['a', 'b', 'c'];
  print('mapped: ${mapIndexed((i, e) => '$e$i', items)}');
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ookami-kb/dfunc/issues
