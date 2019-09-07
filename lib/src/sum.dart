/// Returns sum of all elements in `Iterable`.
/// Returns 0 if iterable is empty.
num sum(Iterable<num> items) {
  if (items.isEmpty) return 0;
  return items.reduce((a1, a2) => a1 + a2);
}
