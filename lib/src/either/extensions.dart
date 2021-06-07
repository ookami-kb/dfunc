import 'dart:async';

import '../func.dart';
import '../identity.dart';
import 'either.dart';

typedef AsyncEither<L, R> = Future<Either<L, R>>;

extension DoEither<L, R> on Either<L, R> {
  /// Performs a side-effect by running [block] function if the value
  /// is left and returns the same Either.
  ///
  /// Can be useful for some logging, e.g.:
  /// ```dart
  /// final either = someEither.doOnLeft(print);
  /// ```
  Either<L, R> doOnLeft(void Function(L v) block) => mapLeft((v) {
        block(v);
        return v;
      });

  /// Performs a side-effect by running [block] function if the value
  /// is right and returns the same Either.
  ///
  /// Can be useful for some logging, e.g.:
  /// ```dart
  /// final either = someEither.doOnRight(print);
  /// ```
  Either<L, R> doOnRight(void Function(R v) block) => map((v) {
        block(v);
        return v;
      });
}

extension EitherAsync<L, R> on Either<L, R> {
  AsyncEither<L, T> mapAsync<T>(FutureOr<T> Function(R) f) => fold(
        (e) async => Either.left(e),
        (r) async => Either.right(await f(r)),
      );

  AsyncEither<L, T> flatMapAsync<T>(FutureOr<Either<L, T>> Function(R) f) =>
      fold(
        (e) async => Either<L, T>.left(e),
        (r) async => await f(r),
      );

  Future<Either<T, R>> mapLeftAsync<T>(FutureOr<T> Function(L) f) => fold(
        (e) async => Either.left(await f(e)),
        (r) async => Either.right(r),
      );

  Future<Either<T, R>> flatMapLeftAsync<T>(
    FutureOr<Either<T, R>> Function(L) f,
  ) =>
      fold(
        (e) async => await f(e),
        (r) async => Either.right(r),
      );

  AsyncEither<L, R> doOnLeftAsync(FutureOr<void> Function(L v) block) =>
      mapLeftAsync((v) async {
        await block(v);
        return v;
      });

  AsyncEither<L, R> doOnRightAsync(FutureOr<void> Function(R v) block) =>
      mapAsync((v) async {
        await block(v);
        return v;
      });
}

extension EitherFutureExtension<L, R> on Either<FutureOr<L>, FutureOr<R>> {
  AsyncEither<L, R> wait() => fold(
        (FutureOr<L> v) async => Either.left(await v),
        (FutureOr<R> v) async => Either.right(await v),
      );
}

extension FutureEitherExtension<L, R> on AsyncEither<L, R> {
  AsyncEither<L, T> mapAsync<T>(FutureOr<T> Function(R) f) async =>
      (await this).mapAsync(f);

  Future<Either<T, R>> mapLeftAsync<T>(FutureOr<T> Function(L) f) async =>
      (await this).mapLeftAsync(f);

  AsyncEither<L, T> flatMapAsync<T>(
    FutureOr<Either<L, T>> Function(R) f,
  ) async =>
      (await this).flatMapAsync(f);

  Future<Either<T, R>> flatMapLeftAsync<T>(
    FutureOr<Either<T, R>> Function(L) f,
  ) async =>
      (await this).flatMapLeftAsync(f);

  Future<T> foldAsync<T>(
    FutureOr<T> Function(L) onLeft,
    FutureOr<T> Function(R) onRight,
  ) async {
    final v = await this;
    return v.fold(onLeft, onRight);
  }

  AsyncEither<L, R> doOnLeftAsync(FutureOr<void> Function(L v) block) async =>
      (await this).mapLeftAsync((v) async {
        await block(v);
        return v;
      });

  AsyncEither<L, R> doOnRightAsync(FutureOr<void> Function(R v) block) async =>
      (await this).mapAsync((v) async {
        await block(v);
        return v;
      });
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
