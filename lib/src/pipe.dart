typedef Pipe<T, S> = S Function(T);

/// Performs left-to-right function composition.
///
/// ```dart
/// final pipe = pipe2(double.parse, (double v) => v.floor());
/// pipe('123.456') // 123
/// ```
Pipe<S, U> pipe2<S, T, U>(Pipe<S, T> f1, Pipe<T, U> f2) =>
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
Pipe<S, V> pipe3<S, T, U, V>(Pipe<S, T> f1, Pipe<T, U> f2, Pipe<U, V> f3) =>
    (S value) => f3(f2(f1(value)));
