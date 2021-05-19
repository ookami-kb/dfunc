import 'dart:async';

import '../func.dart';
import '../identity.dart';
import 'either.dart';

extension EitherAsync<L, R> on Either<L, R> {
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) => fold(
        (e) async => Either.left(e),
        (r) async => Either.right(await f(r)),
      );

  Future<Either<L, T>> flatMapAsync<T>(
    FutureOr<Either<L, T>> Function(R) f,
  ) =>
      fold(
        (e) async => Either<L, T>.left(e),
        (r) async => await f(r),
      );

  Future<Either<T, R>> mapLeftAsync<T>(FutureOr<T> Function(L) f) => fold(
        (e) async => Either.left(await f(e)),
        (r) async => Either.right(r),
      );
}

extension EitherFutureExtension<L, R> on Either<FutureOr<L>, FutureOr<R>> {
  Future<Either<L, R>> wait() => fold(
        (FutureOr<L> v) async => Either.left(await v),
        (FutureOr<R> v) async => Either.right(await v),
      );
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) async =>
      (await this).mapAsync(f);

  Future<Either<T, R>> mapLeftAsync<T>(FutureOr<T> Function(L) f) async =>
      (await this).mapLeftAsync(f);

  Future<Either<L, T>> flatMapAsync<T>(
    FutureOr<Either<L, T>> Function(R) f,
  ) async =>
      (await this).flatMapAsync(f);

  Future<T> foldAsync<T>(
    FutureOr<T> Function(L) onLeft,
    FutureOr<T> Function(R) onRight,
  ) async {
    final v = await this;
    return v.fold(onLeft, onRight);
  }
}

extension SameEitherExtension<T> on FutureOr<Either<T, T>> {
  Future<T> join() async {
    final x = await this;
    return x.fold(identity, identity);
  }
}

extension MapFoldStreamEither<L, R> on Stream<Either<L, R>> {
  Stream<S> mapFold<S>(Func1<L, S> onLeft, Func1<R, S> onRight) =>
      map((s) => s.fold(onLeft, onRight));
}
