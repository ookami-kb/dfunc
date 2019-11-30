import 'dart:async';

import 'package:dfunc/dfunc.dart';

abstract class Either<L, R> {
  Either._();

  factory Either.left(L value) => _Left._(value);

  factory Either.right(R value) => _Right._(value);

  bool isLeft() => this is _Left;

  bool isRight() => this is _Right;

  L get left => null;

  R get right => null;

  T fold<T>(T Function(L) onLeft, T Function(R) onRight);

  Either<L, T> map<T>(T Function(R) f);

  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f);

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f);

  Future<Either<L, T>> flatMapAsync<T>(FutureOr<Either<L, T>> Function(R) f);
}

class _Left<L, R> extends Either<L, R> {
  _Left._(this._value) : super._();

  final L _value;

  @override
  L get left => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Left._(_value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => _Left._(_value);

  @override
  Future<Either<L, T>> flatMapAsync<T>(
          FutureOr<Either<L, T>> Function(R) f) async =>
      _Left._(_value);

  @override
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) async =>
      _Left._(_value);
}

class _Right<L, R> extends Either<L, R> {
  _Right._(this._value) : super._();

  final R _value;

  @override
  R get right => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Right._(f(_value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => f(_value);

  @override
  Future<Either<L, T>> flatMapAsync<T>(
          FutureOr<Either<L, T>> Function(R) f) async =>
      f(_value);

  @override
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) async =>
      _Right._(f(_value));
}

extension EitherFutureExtension<L, R> on Either<FutureOr<L>, FutureOr<R>> {
  Future<Either<L, R>> wait() => this.fold(
        (v) async => Either.left(await v),
        (v) async => Either.right(await v),
      );
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, T>> map<T>(FutureOr<T> Function(R) f) =>
      then((v) => v.map(f));

  Future<Either<L, T>> flatMap<T>(FutureOr<Either<L, T>> Function(R) f) =>
      then((v) => v.flatMap(f));

  Future<T> fold<T>(
    FutureOr<T> Function(L) onLeft,
    FutureOr<T> Function(R) onRight,
  ) =>
      then((v) => v.fold(onLeft, onRight));
}

extension SameEitherExtension<T> on FutureOr<Either<T, T>> {
  Future<T> join() async {
    final x = await this;
    return x.fold(identity, identity);
  }
}
