import 'dart:async';

import 'package:dfunc/src/identity.dart';
import 'package:dfunc/src/optional/optional.dart';

extension TraversableOptional<A> on Optional<A> {
  Future<Optional<B>> traverseFuture<B>(Future<B> Function(A) f) async {
    final v = await fold(() async => null, (v) => f(v));
    return Optional.of(v);
  }

  Iterable<Optional<B>> traverseIterable<B>(Iterable<B> Function(A) f) =>
      fold(() => [empty()], (v) => f(v).map((e) => some(e)));
}

extension OptionalFutureSequence<A> on Optional<Future<A>> {
  Future<Optional<A>> sequence() => traverseFuture(identity);
}

extension OptionalIterableSequence<A> on Optional<Iterable<A>> {
  Iterable<Optional<A>> sequence() => traverseIterable(identity);
}
