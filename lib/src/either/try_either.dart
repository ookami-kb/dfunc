import 'dart:async';

import 'package:dfunc/dfunc.dart';

typedef Result<T> = Either<Exception, T>;
typedef AsyncResult<T> = Future<Result<T>>;

extension ResultUnwrap<R> on Result<R> {
  R unwrap() => fold((e) => throw e, (r) => r);
}

/// Wraps [block] function into try..catch and returns [Right] with the
/// result. In case of any [Exception] returns [Left] with the exception.
///
/// It doesn't catch [Error]s as it usually means a bug in the code.
Result<T> tryEither<T>(T Function() block) {
  try {
    return Either.right(block());
  } on Exception catch (e) {
    return Either.left(e);
  }
}

/// Wraps [block] function into try..catch asynchronously and returns [Future]
/// with [Right] with the result. In case of any [Exception] returns [Future]
/// with [Left] containing the exception.
///
/// It doesn't catch [Error]s as it usually means a bug in the code.
AsyncResult<T> tryEitherAsync<T>(FutureOr<T> Function() block) async {
  try {
    return Either.right(await block());
  } on Exception catch (e) {
    return Either.left(e);
  }
}

extension FutureToEitherExt<T> on Future<T> {
  AsyncResult<T> toEither() async => tryEitherAsync(() => this);
}

extension IterableResultExt<T> on Iterable<Result<T>> {
  Result<List<T>> sequence() =>
      tryEither(() => this.map((e) => e.unwrap()).toList());
}
