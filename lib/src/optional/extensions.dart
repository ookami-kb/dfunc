import 'dart:async';

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
  Future<Optional<U>> map<U>(FutureOr<U> Function(T) f) async =>
      (await this).mapAsync(f);

  Future<Optional<U>> flatMap<U>(FutureOr<Optional<U>> Function(T) f) async =>
      (await this).flatMapAsync(f);
}

extension OptionalExtension<T> on T {
  Optional<T> toOptional() => Optional.of(this);
}
