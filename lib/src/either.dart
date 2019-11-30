import 'dart:async';

abstract class Either<L, R> {
  Either._();

  factory Either.left(L value) => _Left._(value);

  factory Either.right(R value) => _Right._(value);

  bool isLeft() => this is _Left;

  bool isRight() => this is _Right;

  L get left => isLeft() ? (this as _Left<L, R>).value : null;

  R get right => isRight() ? (this as _Right<L, R>).value : null;

  T fold<T>(T Function(L) onLeft, T Function(R) onRight);

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) =>
      fold((v) => _Left<L, T>._(v), (v) => f(v));

  Future<Either<L, T>> flatMapAsync<T>(FutureOr<Either<L, T>> Function(R) f) =>
      fold((v) async => _Left<L, T>._(v), (v) async => f(v));
}

class _Left<L, R> extends Either<L, R> {
  _Left._(this._value) : super._();

  final L _value;

  L get value => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(_value);
}

class _Right<L, R> extends Either<L, R> {
  _Right._(this._value) : super._();

  final R _value;

  R get value => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(_value);
}

extension EitherFutureExtension<L, R> on Either<FutureOr<L>, FutureOr<R>> {
  Future<Either<L, R>> wait() => this.fold(
        (v) async => Either.left(await v),
        (v) async => Either.right(await v),
      );
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, T>> flatMap<T>(Either<L, T> Function(R) f) =>
      then((v) => v.flatMap(f));

  Future<T> fold<T>(T Function(L) onLeft, T Function(R) onRight) =>
      then((v) => v.fold(onLeft, onRight));
}

extension SameEitherExtension<T> on FutureOr<Either<T, T>> {
  Future<T> join() async {
    final x = await this;
    return x.fold((x) => x, (x) => x);
  }
}
