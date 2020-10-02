import 'dart:async';

import 'package:dfunc/src/identity.dart';
import 'package:dfunc/src/optional/optional.dart';

extension TraversableIterable<A> on Iterable<A> {
  Optional<Iterable<B>> traverseOptional<B>(Optional<B> Function(A) f) {
    try {
      return some(map((e) => f(e).getOrElse(() => throw ArgumentError())));
    } on ArgumentError {
      return empty();
    }
  }

  Future<Iterable<B>> traverseFuture<B>(FutureOr<B> Function(A) f) =>
      Future.wait(map((a) async => await f(a)));
}

extension IterableOptionalSequence<A> on Iterable<Optional<A>> {
  Optional<Iterable<A>> sequence() => traverseOptional(identity);
}

extension IterableFutureSequence<A> on Iterable<Future<A>> {
  Future<Iterable<A>> sequence() => traverseFuture(identity);
}
