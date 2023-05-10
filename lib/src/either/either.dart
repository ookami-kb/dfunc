/// Represents a value that can be either of type [L] or of type [R].
/// Usually [L] is assumed to be of Error type and [R] of Right type, e.g.:
///
/// ```
/// typedef Result<T> = Either<Exception, T>;
/// ```
sealed class Either<L, R> {
  const Either._();

  const factory Either.left(L value) = Left<L, R>.new;

  const factory Either.right(R value) = Right<L, R>.new;

  bool isLeft() => this is Left;

  bool isRight() => this is Right;

  L get _left;

  R get _right;

  T fold<T>(T Function(L) onLeft, T Function(R) onRight);

  Either<L, T> map<T>(T Function(R) f);

  Either<L, T> flatMap<T>(Either<L, T> Function(R) f);

  Either<L1, R> mapLeft<L1>(L1 Function(L) f) => fold(
        (l) => Either.left(f(l)),
        Either.right,
      );

  Either<L, (R, R2)> combine<R2>(Either<L, R2> other) => isLeft()
      ? Either.left(_left)
      : other.isLeft()
          ? Either.left(other._left)
          : Either.right((_right, other._right));
}

/// Sortcut for [Either.left].
Either<L, R> left<L, R>(L value) => Either.left(value);

/// Shortcut for [Either.right].
Either<L, R> right<L, R>(R value) => Either.right(value);

final class Left<L, R> extends Either<L, R> {
  const Left(this.value) : super._();

  final L value;

  @override
  L get _left => value;

  @override
  R get _right => throw StateError('right called on left value');

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(value);

  @override
  Either<L, T> map<T>(T Function(R) f) => Left(value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => Left(value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) => other is Left<L, R> && other.value == value;

  @override
  String toString() => 'Left($value)';
}

final class Right<L, R> extends Either<L, R> {
  const Right(this.value) : super._();

  final R value;

  @override
  L get _left => throw StateError('left called on right value');

  @override
  R get _right => value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(value);

  @override
  Either<L, T> map<T>(T Function(R) f) => Right(f(value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R) f) => f(value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Right<L, R> && other.value == value;

  @override
  String toString() => 'Right($value)';
}
