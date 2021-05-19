import '../dfunc.dart';

/// Creates an iterable of [Product2<A, B>] by pairing up
/// equally positioned items from both iterables [a] and [b].
/// The returned iterable is truncated to the length of the shorter
/// of the two iterables.
Iterable<Product2<A, B>> zip2<A, B>(Iterable<A> a, Iterable<B> b) sync* {
  final first = a.iterator;
  final second = b.iterator;
  while (first.moveNext() && second.moveNext()) {
    yield Product2(first.current, second.current);
  }
}

extension Zip<A> on Iterable<A> {
  /// Creates an iterable of [Product2<A, B>] by pairing up
  /// equally positioned items from both iterables [this] and [other].
  /// The returned iterable is truncated to the length of the shorter
  /// of the two iterables.
  Iterable<Product2<A, B>> zipWith<B>(Iterable<B> other) => zip2(this, other);
}
