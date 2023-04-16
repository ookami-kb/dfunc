import 'package:dfunc/src/transformer.dart';

/// Signature for the separator builder in `intersperseWith` method.
///
/// Builds an element of type [B] given [prev] and [next] elements of type [A].
typedef SeparatorBuilder<A, B> = B Function(A prev, A next);

extension Intersperse<A> on Iterable<A> {
  /// Creates a new Iterable<A> with the separator interposed between elements.
  ///
  /// If [beforeFirst] is true, the separator is prepended to the iterable (if
  /// it has at least one element).
  ///
  /// If [afterLast] is true, the separator is appended to the iterable (if it
  /// has at least one element).
  Iterable<A> intersperse(
    A item, {
    bool beforeFirst = false,
    bool afterLast = false,
  }) sync* {
    final iterator = this.iterator;

    if (iterator.moveNext()) {
      if (beforeFirst) {
        yield item;
      }

      yield iterator.current;
      while (iterator.moveNext()) {
        yield item;
        yield iterator.current;
      }

      if (afterLast) {
        yield item;
      }
    }
  }

  /// Creates a new Iterable<A> with the separator interposed between elements.
  ///
  /// Each element in the new iterable is built from the element in the original
  /// iterable using [itemBuilder].
  ///
  /// Each separator in the new iterable is built using [separatorBuilder] that
  /// accepts the original item *before* and *after* this separator.
  ///
  /// If [beforeFirst] is not null and the iterable is not empty, [beforeFirst]
  /// is used as a separator builder that accepts the first element. The result
  /// of its call is prepended to the iterable.
  ///
  /// If [afterLast] is not null and the iterable is not empty, [afterLast] is
  /// used as a separator builder that accepts the last element. The result of
  /// its call is appended to the iterable.
  Iterable<B> intersperseWith<B>({
    required Transformer<A, B> itemBuilder,
    required SeparatorBuilder<A, B> separatorBuilder,
    Transformer<A, B>? beforeFirst,
    Transformer<A, B>? afterLast,
  }) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      if (beforeFirst != null) {
        yield beforeFirst(iterator.current);
      }

      yield itemBuilder(iterator.current);
      var prev = iterator.current;
      while (iterator.moveNext()) {
        yield separatorBuilder(prev, iterator.current);
        prev = iterator.current;
        yield itemBuilder(iterator.current);
      }

      if (afterLast != null) {
        yield afterLast(prev);
      }
    }
  }
}
