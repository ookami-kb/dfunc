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

  L get left;

  R get right;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight);

  Either<L, T> map<T>(T Function(R) f);

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f);

  Either<L, Product2<R, R2>> combine<R2>(Either<L, R2> other) => isLeft()
      ? Either.left(left)
      : other.isLeft()
          ? Either.left(other.left)
          : Either.right(Product2(right, other.right));
}

class _Left<L, R> extends Either<L, R> {
  const _Left._(this._value) : super._();

  final L _value;

  @override
  L get left => _value;

  @override
  R get right => throw StateError('right called on left value');

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Left._(_value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => _Left._(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is _Left<L, R> && other._value == _value;

  @override
  String toString() => 'Left($_value)';
}

class _Right<L, R> extends Either<L, R> {
  const _Right._(this._value) : super._();

  final R _value;

  @override
  L get left => throw StateError('left called on right value');

  @override
  R get right => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(_value);

  @override
  Either<L, T> map<T>(T Function(R) f) => _Right._(f(_value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => f(_value);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is _Right<L, R> && other._value == _value;

  @override
  String toString() => 'Right($_value)';
}
