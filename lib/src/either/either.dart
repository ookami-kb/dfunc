// ignore_for_file: avoid_implementing_value_types

import 'package:dfunc/dfunc.dart';

/// One of the popular examples of [Coproduct2] type.
///
/// It represents a value that can be either of type [L] or of type [R].
/// Usually [L] is assumed to be of Error type and [R] of Right type, e.g.
/// in pseudo-code:
///
/// ```
/// type Result<T> = Either<Exception, T>
/// ```
abstract class Either<L, R> implements Coproduct2<L, R> {
  const Either._();

  const factory Either.left(L value) = _Left<L, R>._;

  const factory Either.right(R value) = _Right<L, R>._;

  bool isLeft() => this is _Left;

  bool isRight() => this is _Right;

  L get _left;

  R get _right;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight);

  Either<L, T> map<T>(T Function(R) f);

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f);

  Either<L1, R> mapLeft<L1>(L1 Function(L) f) => fold(
        (l) => Either.left(f(l)),
        (r) => Either.right(r),
      );

  Either<L, Product2<R, R2>> combine<R2>(Either<L, R2> other) => isLeft()
      ? Either.left(_left)
      : other.isLeft()
          ? Either.left(other._left)
          : Either.right(Product2(_right, other._right));
}

/// Sortcut for [Either.left].
Either<L, R> left<L, R>(L value) => Either.left(value);

/// Shortcut for [Either.right].
Either<L, R> right<L, R>(R value) => Either.right(value);

class _Left<L, R> extends Either<L, R> {
  const _Left._(this._value) : super._();

  final L _value;

  @override
  L get _left => _value;

  @override
  R get _right => throw StateError('right called on left value');

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Left._(_value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => _Left._(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(Object other) =>
      other is _Left<L, R> && other._value == _value;

  @override
  String toString() => 'Left($_value)';
}

class _Right<L, R> extends Either<L, R> {
  const _Right._(this._value) : super._();

  final R _value;

  @override
  L get _left => throw StateError('left called on right value');

  @override
  R get _right => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Right._(f(_value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => f(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(Object other) =>
      other is _Right<L, R> && other._value == _value;

  @override
  String toString() => 'Right($_value)';
}
