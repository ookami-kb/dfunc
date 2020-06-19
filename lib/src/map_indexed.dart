import 'package:dfunc/dfunc.dart';
import 'package:dfunc/src/utils.dart';

/// Returns a new [Iterable] with elements that are created by
///  calling `f` on each element of [items] in iteration order and
///  provides position of the element as a first argument of `f`.
Iterable<T> mapIndexed<T, E>(Func2<int, E, T> f, Iterable<E> items) =>
    _mapIndexed(f, items);

extension MapIndexed<E> on Iterable<E> {
  /// Returns a new [Iterable] with elements that are created by
  ///  calling `f` on each element of current iterable in iteration order and
  ///  provides position of the element as a first argument of `f`.
  Iterable<T> mapIndexed<T>(Func2<int, E, T> f) => _mapIndexed(f, this);
}

Iterable<T> _mapIndexed<T, E>(Func2<int, E, T> f, Iterable<E> items) => items
    .toListOrThis()
    .asMap()
    .map((int i, E e) => MapEntry(i, f(i, e)))
    .values;
