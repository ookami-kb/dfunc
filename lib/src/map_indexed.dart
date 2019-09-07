/// Returns a new [Iterable] with elements that are created by
///  calling `f` on each element of this `List` in iteration order and
///  provides position of the element as a first argument of `f`.
Iterable<T> mapIndexed<T, E>(T f(int i, E e), List<E> items) =>
    items.asMap().map((int i, E e) => MapEntry(i, f(i, e))).values;
