extension MaybeFirstWhere<T> on Iterable<T> {
  T? maybeFirstWhere(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
