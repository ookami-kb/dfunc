A library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

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
