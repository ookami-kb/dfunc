import 'dart:async';

import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/optional/optional.dart';

extension OptionalAsync<T> on Optional<T> {
  Future<Optional<U>> mapAsync<U>(FutureOr<U> Function(T) f) async {
    final value = getOrNull();
    return value == null ? Optional.empty() : Optional.of(await f(value));
  }

  Future<Optional<U>> flatMapAsync<U>(
      FutureOr<Optional<U>> Function(T) f) async {
    final value = getOrNull();
    return value == null ? Optional.empty() : await f(value);
  }
}

extension FutureOptionalExtension<T> on Future<Optional<T>> {
  Future<Optional<U>> mapAsync<U>(FutureOr<U> Function(T) f) async =>
      (await this).mapAsync(f);

  Future<Optional<U>> flatMapAsync<U>(
    FutureOr<Optional<U>> Function(T) f,
  ) async =>
      (await this).flatMapAsync(f);

  Future<U> foldAsync<U>(Func0<U> onEmpty, Func1<T, U> onValue) =>
      then((v) => v.fold(onEmpty, onValue));
}

extension OptionalExtension<T> on T? {
  Optional<T> toOptional() => Optional.of(this);
}

extension MapFoldStreamOptional<T> on Stream<Optional<T>> {
  Stream<S> mapFold<S>(Func0<S> onEmpty, Func1<T, S> onValue) =>
      map((s) => s.fold(onEmpty, onValue));
}
