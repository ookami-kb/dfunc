import 'func.dart';
import 'identity.dart';
import 'scope.dart';

/// Transforms function [f] taking non-nullable argument into a function
/// taking nullable argument.
Func1<B?, A?> lift<A extends Object, B extends Object>(Func1<B, A?> f) =>
    (B? b) => b?.let(f);

/// Catches all exceptions and returns null in case of an exception.
A? catches<A extends Object>(Func0<A?> a) {
  try {
    return a();
  } on Exception {
    return null;
  }
}

/// Combines to nullable values [a] and [b] using a binary function [f].
/// If either nullable value is null, the result is null.
C? map2<A extends Object, B extends Object, C extends Object>(
  A? a,
  B? b,
  Func2<A, B, C?> f,
) {
  if (a == null || b == null) return null;
  return f(a, b);
}

/// Maps over the list and applies [f] to each non-null element.
/// Returns the list of non-null values if all elements and results of
/// applying [f] are not null, otherwise returns null.
List<B>? traverse<A extends Object, B extends Object>(
  List<A?> xa,
  Func1<A, B?> f,
) {
  final List<B> result = [];

  for (final a in xa) {
    if (a == null) return null;
    final b = f(a);
    if (b == null) return null;

    result.add(b);
  }

  return result;
}

/// Combines a list of nullable values into one nullable list with non-nullable
/// values. If any of the values is null, the result is null.
List<A>? sequence<A extends Object>(List<A?> xs) => traverse(xs, identity);
