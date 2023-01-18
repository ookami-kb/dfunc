import 'dart:async';

import 'package:dfunc/dfunc.dart';

typedef Result<T> = Either<Exception, T>;

typedef AsyncResult<T> = Future<Result<T>>;

typedef BindEither = T Function<T>(Result<T>);

AsyncResult<T> tryEitherAsync<T>(
  FutureOr<T> Function(BindEither bind) block,
) async {
  A bind<A>(Result<A> either) => either.fold((e) => throw e, identity);

  try {
    return Either.right(await block(bind));
  } on Exception catch (e) {
    return Either.left(e);
  }
}

Result<T> tryEither<T>(T Function(BindEither bind) block) {
  A bind<A>(Result<A> either) => either.fold((e) => throw e, identity);

  try {
    return Either.right(block(bind));
  } on Exception catch (e) {
    return Either.left(e);
  }
}

extension FutureToEitherExt<T> on Future<T> {
  AsyncResult<T> toEither() async {
    try {
      return Either.right(await this);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}

extension IterableResultExt<T> on Iterable<Result<T>> {
  Result<List<T>> sequence() =>
      tryEither((bind) => this.map((e) => bind(e)).toList());
}
