Iterable<T> mapIndexed<T, E>(T f(int i, E e), List<E> items) =>
    items.asMap().map((int i, E e) => MapEntry(i, f(i, e))).values;
