import 'dart:async';

import 'package:dfunc/src/either/either.dart';
import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/identity.dart';

extension EitherAsync<L, R> on Either<L, R> {
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) async =>
      isLeft() ? Either.left(left) : Either.right(await f(right));

  Future<Either<L, T>> flatMapAsync<T>(FutureOr<Either<L, T>> Function(R) f) async =>
      isLeft() ? Either.left(left) : f(right);
}

extension EitherFutureExtension<L, R> on Either<FutureOr<L>, FutureOr<R>> {
  Future<Either<L, R>> wait() => fold(
        (v) async => Either.left(await v),
        (v) async => Either.right(await v),
      );
}

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, T>> mapAsync<T>(FutureOr<T> Function(R) f) async {
    final either = await this;
    return either.isLeft() ? Either.left(either.left) : Either.right(await f(either.right));
  }

  Future<Either<L, T>> flatMapAsync<T>(FutureOr<Either<L, T>> Function(R) f) async {
    final either = await this;
    return either.isLeft() ? Either.left(either.left) : await f(either.right);
  }

  Future<T> foldAsync<T>(Func1<L, FutureOr<T>> onLeft, Func1<R, FutureOr<T>> onRight) =>
      then((v) => v.fold(onLeft, onRight));
}

extension SameEitherExtension<T> on FutureOr<Either<T, T>> {
  Future<T> join() async {
    final x = await this;
    return x.fold(identity, identity);
  }
}

extension MapFoldStreamEither<L, R> on Stream<Either<L, R>> {
  Stream<S> mapFold<S>(Func1<L, S> onLeft, Func1<R, S> onRight) => map((s) => s.fold(onLeft, onRight));
}
