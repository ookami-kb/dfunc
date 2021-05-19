import 'dart:async';

import '../either/either.dart';
import '../identity.dart';

typedef BindEither<L> = R Function<R>(Either<L, R>);

Either<L, R> eitherFx<L, R>(R Function(BindEither<L> bind) run) {
  R1 _bind<R1>(Either<L, R1> value) =>
      value.fold((e) => throw _BindEitherError(e), identity);

  try {
    return Either.right(run(_bind));
    // ignore: avoid_catching_errors
  } on _BindEitherError<L> catch (e) {
    return Either<L, R>.left(e.internal);
  }
}

Future<Either<L, R>> eitherFxAsync<L, R>(
  FutureOr<R> Function(BindEither<L> bind) run,
) async {
  R1 _bind<R1>(Either<L, R1> value) =>
      value.fold((e) => throw _BindEitherError(e), identity);

  try {
    return Either.right(await run(_bind));
    // ignore: avoid_catching_errors
  } on _BindEitherError<L> catch (e) {
    return Either.left(e.internal);
  }
}

class _BindEitherError<L> extends Error {
  _BindEitherError(this.internal);

  final L internal;
}
