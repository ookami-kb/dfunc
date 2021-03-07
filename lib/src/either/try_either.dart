import 'dart:async';

import 'package:dfunc/dfunc.dart';

typedef BindEither = T Function<T>(Either<Exception, T>);

Future<Either<Exception, T>> tryEitherAsync<T>(
  FutureOr<T> Function(BindEither bind) block,
) async {
  A bind<A>(Either<Exception, A> either) =>
      either.fold((e) => throw e, identity);

  try {
    return Either.right(await block(bind));
  } on Exception catch (e) {
    return Either.left(e);
  }
}

Either<Exception, T> tryEither<T>(T Function(BindEither bind) block) {
  A bind<A>(Either<Exception, A> either) =>
      either.fold((e) => throw e, identity);

  try {
    return Either.right(block(bind));
  } on Exception catch (e) {
    return Either.left(e);
  }
}

extension FutureToEitherExt<T> on Future<T> {
  Future<Either<Exception, T>> toEither() async {
    try {
      return Either.right(await this);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
