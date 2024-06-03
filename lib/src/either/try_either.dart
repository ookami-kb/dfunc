import 'dart:async';

import 'package:dfunc/dfunc.dart';

typedef Result<T> = Either<Exception, T>;
typedef AsyncResult<T> = Future<Result<T>>;
typedef BindEither = T Function<T>(Result<T>);

/// Wraps [block] function into try..catch and returns [Right] with the
/// result. In case of any [Exception] returns [Left] with the exception.
///
/// It doesn't catch [Error]s as it usually means a bug in the code.
Result<T> tryEither<T>(T Function(BindEither bind) block) {
  A bind<A>(Result<A> either) => either.fold((e) => throw e, identity);

  try {
    return Either.right(block(bind));
  } on Exception catch (error) {
    return Either.left(error);
  }
}

/// Wraps [block] function into try..catch asynchronously and returns [Future]
/// with [Right] with the result. In case of any [Exception] returns [Future]
/// with [Left] containing the exception.
///
/// It doesn't catch [Error]s as it usually means a bug in the code.
AsyncResult<T> tryEitherAsync<T>(
  FutureOr<T> Function(BindEither bind) block,
) async {
  try {
    A bind<A>(Result<A> either) => either.fold((e) => throw e, identity);

    return Either.right(await block(bind));
  } on Exception catch (error) {
    return Either.left(error);
  }
}

extension FutureToEitherExt<T> on Future<T> {
  AsyncResult<T> toEither() async {
    try {
      return Either.right(await this);
    } on Exception catch (error) {
      return Either.left(error);
    }
  }
}

extension IterableResultExt<T> on Iterable<Result<T>> {
  Result<List<T>> sequence() =>
      tryEither((bind) => this.map((e) => bind(e)).toList());
}
