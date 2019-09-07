typedef Mapper<T, S> = Iterable<S> Function(Iterable<T>);

/// Creates a mapper, i.e. a function that takes a list of `S` and maps it
/// into a list of `T`.
///
/// This is a shorthand method for a more convenient use – instead of
///
/// ```dart
/// Mapper<String, int> mapper = (Iterable<int> list) => list.map(int.parse);
/// ```
///
/// you can write:
///
/// ```dart
/// Mapper<String, int> mapper = map(int.parse);
/// ```
Mapper<T, S> map<T, S>(S Function(T) f) => (Iterable<T> list) => list.map(f);
