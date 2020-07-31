import 'package:dfunc/src/func.dart';

/// Performs left-to-right function composition.
///
/// ```dart
/// final pipe = pipe2(double.parse, (double v) => v.floor());
/// pipe('123.456') // 123
/// ```
Func1<S, U> pipe2<S, T, U>(Func1<S, T> f1, Func1<T, U> f2) =>
    (S value) => f2(f1(value));

/// Performs left-to-right function composition.
///
/// ```dart
/// final pipe = pipe3(
///   double.parse,
///   (double v) => v.floor(),
///   (int v) => v.toString(),
/// );
/// pipe('123.456') // '123'
/// ```
Func1<S, V> pipe3<S, T, U, V>(Func1<S, T> f1, Func1<T, U> f2, Func1<U, V> f3) =>
    (S value) => f3(f2(f1(value)));

extension Pipe<A, B> on Func1<A, B> {
  /// Performs left-to-right function composition.
  ///
  /// ```dart
  /// final pipe = double.parse.pipe((double v) => v.floor());
  /// pipe('123.456') // 123
  /// ```
  Func1<A, C> pipe<C>(Func1<B, C> f) => pipe2(this, f);
}
