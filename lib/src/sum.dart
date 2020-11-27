/// Returns sum of all elements in `Iterable`.
/// Returns 0 if iterable is empty.
T sum<T extends num>(Iterable<T> items) {
  if (items.isEmpty) return 0 as T;
  // ignore: unnecessary_parenthesis
  return items.reduce((T a1, T a2) => (a1 + a2) as T);
}
