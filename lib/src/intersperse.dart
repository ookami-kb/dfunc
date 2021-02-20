extension Intersperse<T> on Iterable<T> {
  /// Creates a new Iterable<T> with the separator interposed between elements.
  Iterable<T> intersperse(T item) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield item;
        yield iterator.current;
      }
    }
  }
}
