/// Returns a new [Iterable] with elements that are created by
///  calling `f` on each element of [items] in iteration order and
///  provides position of the element as a first argument of `f`.
Iterable<T> mapIndexed<T, E>(T f(int i, E e), Iterable<E> items) =>
    _mapIndexed(f, items);

extension MapIndexed<E> on Iterable<E> {
  /// Returns a new [Iterable] with elements that are created by
  ///  calling `f` on each element of current iterable in iteration order and
  ///  provides position of the element as a first argument of `f`.
  Iterable<T> mapIndexed<T>(T Function(int i, E element) f) =>
      _mapIndexed(f, this);
}

Iterable<T> _mapIndexed<T, E>(T f(int i, E e), Iterable<E> items) {
  final list = items is List<E> ? items : items.toList();
  return list.asMap().map((int i, E e) => MapEntry(i, f(i, e))).values;
}
