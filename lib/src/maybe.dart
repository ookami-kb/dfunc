import 'func.dart';
import 'func/predicate.dart';
import 'scope.dart';

extension Maybe<A extends Object> on A? {
  B? maybeMap<B extends Object>(Func1<A, B> f) => this?.let(f);

  B? maybeFlatMap<B extends Object>(Func1<A, B?> f) => this?.let(f);

  /// Filters value based on predicate [f] and returns either value itself
  /// or null.
  ///
  /// Same as you can filter the list with `where` method to remove undesired
  /// values (and probably get an empty list), you can use `maybeWhere` to
  /// "filter" optional value. As a result you will get either the value itself,
  /// or null if the condition is not satisfied:
  ///
  /// ```dart
  /// final int b = 1;
  /// b.maybeWhere((e) => e == 1); // 1
  /// b.maybeWhere((e) => e == 2); // null
  /// ```
  A? maybeWhere(Predicate<A> f) => maybeFlatMap((v) => f(v) ? v : null);
}
