extension Compact<T> on Iterable<T?> {
  /// {@template dfunc.compact}
  /// Filters out all `null` values from [Iterable].
  ///
  /// ```dart
  /// [1, 2, null, 3].compact(); // [1, 2, 3]
  /// ```
  /// {@endtemplate}
  Iterable<T> compact() => whereType<T>();
}

/// {@macro dfunc.compact}
Iterable<T> compact<T>(Iterable<T?> items) => items.compact();
