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

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f);

  Either<L, Product2<R, R2>> combine2<R2>(Either<L, R2> other) => isLeft()
      ? Either.left(left)
      : other.isLeft()
          ? Either.left(other.left)
          : Either.right(Tuple2(right, other.right));
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
}
