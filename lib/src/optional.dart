import 'dart:async';

class Optional<T> {
  Optional._(this._value);

  factory Optional.of(T value) => Optional._(value);

  factory Optional.empty() => Optional.of(null);

  final T _value;

  bool isEmpty() => _value == null;

  T get() =>
      _value == null
          ? throw StateError('get() called on empty Optional.')
          : _value;

  T getOrNull() => _value;

  T getOrElse(T Function() ifEmpty) => _value == null ? ifEmpty() : _value;

  Optional<U> map<U>(U Function(T) f) =>
      _value == null ? Optional.empty() : Optional.of(f(_value));

  Optional<U> flatMap<U>(Optional<U> Function(T) f) =>
      _value == null ? Optional.empty() : f(_value);

  Future<Optional<U>> mapAsync<U>(FutureOr<U> Function(T) f) async =>
      _value == null ? Optional.empty() : Optional.of(await f(_value));

  Future<Optional<U>> flatMapAsync<U>(
      FutureOr<Optional<U>> Function(T) f) async =>
      _value == null ? Optional.empty() : await f(_value);

  Optional<T> where(bool Function(T) predicate) =>
      map((v) => predicate(v) ? v : null);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is Optional<T> && _value == other._value;

  @override
  String toString() =>
      _value == null ? 'Optional(empty)' : 'Optional(value: $_value)';
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
