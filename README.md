![](https://github.com/ookami-kb/dfunc/workflows/Dart%20CI/badge.svg)
[![Pub Version](https://img.shields.io/pub/v/dfunc)](https://pub.dev/packages/dfunc)

Lightweight and practical functional library for Dart programming language.

The goal of this library is not deep and hardcore FP features. If you need them, take a look
at [dartz](https://pub.dev/packages/dartz) package.

`dfunc` instead, provides some practical features base on FP principles, that we use extensively in our production
codebase. We try to keep the library aligned with "Dart way" of doing things, instead of turning it into Haskell or
Scala :)

## Optional

There's no `Optional` type. Since nullsafety is introduced, nullable types cover the majority of use-cases for them.
Instead, `dfunc` provides you some extensions for nullable types.

### maybeMap and maybeFlatMap

```dart
void main() {
  String? x = null;
  x.maybeMap((x) => x.toUpperCase()); // null

  x = 'test';
  x.maybeMap((x) => x.toUpperCase()); // 'TEST'

  x.maybeFlatMap((x) => x == 'test' ? 'OK' : null); // 'OK'
}
```

Both `maybeMap` and `maybeFlatMap` can be replaced with `let` if you prefer Kotlin-style:

```dart
void main() {
  String? x = null;
  x?.let((x) => x.toUpperCase()); // null

  x = 'test';
  x?.let((x) => x.toUpperCase()); // 'TEST'

  x?.let((x) => x == 'test' ? 'OK' : null); // 'OK'
}
```

The differences are:

- you don't need `?.` with `maybe*` functions, they unwrap the value automatically;
- you can enforce the function in `maybeMap` to return non-nullable result.

### maybeWhere

Same as you can filter the list with `where` method to remove undesired values (and probably get an empty list), you can
use `maybeWhere` to "filter" optional value. As a result you will get either the value itself, or null if the condition
is not satisfied:

```dart
void main() {
  final List<int> a = [1];
  a.where((e) => e == 1); // [1]
  a.where((e) => e == 2); // []

  final int b = 1;
  b.maybeWhere((e) => e == 1); // 1
  b.maybeWhere((e) => e == 2); // null
}
```

## Either

TBD

## Utilities

A simple usage example:

TBD

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/ookami-kb/dfunc/issues).
