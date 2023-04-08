import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/func/predicate.dart';
import 'package:dfunc/src/scope.dart';

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

  /// Filters value based on type [B] and returns either value itself or null.
  ///
  /// Same as you can filter the list with `whereType` method to remove
  /// undesired types (and probably get an empty list), you can use
  /// `maybeWhereType` to "filter" by type. As a result you will get either the
  /// value itself, or null if its type is not [B]:
  ///
  /// ```dart
  /// final int b = 1;
  /// b.maybeWhereType<int>(); // 1
  /// b.maybeWhereType<String>(); // null
  /// ```
  B? maybeWhereType<B>() => this?.let((it) => it is B ? it as B : null);

  /// Returns result of [f] if `this` is null, else returns `this`.
  A ifNull(A Function() f) => this ?? f();
}
