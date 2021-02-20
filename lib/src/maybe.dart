import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/func/predicate.dart';
import 'package:dfunc/src/scope.dart';

extension Maybe<A extends Object> on A? {
  B? maybeMap<B extends Object>(Func1<A, B> f) => this?.let(f);

  B? maybeFlatMap<B extends Object>(Func1<A, B?> f) => this?.let(f);

  A? maybeWhere(Predicate<A> f) => maybeFlatMap((v) => f(v) ? v : null);
}
