extension ToListOrThis<T> on Iterable<T> {
  List<T> toListOrThis() => this is List<T> ? this as List<T> : toList();
}
