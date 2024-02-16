import 'dart:async';

import 'package:dfunc/dfunc.dart';

typedef BindEither = T Function<T>(Result<T>);

extension EitherUnwrap<R> on Result<R> {
  R unwrap() => fold((e) => throw e, (r) => r);
}

@Deprecated('Use Either.wrapAsync instead')
AsyncResult<T> tryEitherAsync<T>(
  FutureOr<T> Function(BindEither bind) block,
) async {
  A bind<A>(Result<A> either) => either.unwrap();

  return Either.wrapAsync(() => block(bind));
}

@Deprecated('Use Either.wrap instead')
Result<T> tryEither<T>(T Function(BindEither bind) block) {
  A bind<A>(Result<A> either) => either.unwrap();

  return Either.wrap(() => block(bind));
}

extension FutureToEitherExt<T> on Future<T> {
  AsyncResult<T> toEither() async => Either.wrapAsync(() => this);
}

extension IterableResultExt<T> on Iterable<Result<T>> {
  Result<List<T>> sequence() =>
      Either.wrap(() => this.map((e) => e.unwrap()).toList());
}
