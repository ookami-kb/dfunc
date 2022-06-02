import 'package:dfunc/src/transformer.dart';

/// Signature for the separator builder in `intersperseWith` method.
///
/// Builds an element of type [B] given [prev] and [next] elements of type [A].
typedef SeparatorBuilder<A, B> = B Function(A prev, A next);

extension Intersperse<A> on Iterable<A> {
  /// Creates a new Iterable<A> with the separator interposed between elements.
  Iterable<A> intersperse(A item) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield item;
        yield iterator.current;
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
  Iterable<B> intersperseWith<B>({
    required Transformer<A, B> itemBuilder,
    required SeparatorBuilder<A, B> separatorBuilder,
  }) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield itemBuilder(iterator.current);
      var prev = iterator.current;
      while (iterator.moveNext()) {
        yield separatorBuilder(prev, iterator.current);
        prev = iterator.current;
        yield itemBuilder(iterator.current);
      }
    }
  }
}
