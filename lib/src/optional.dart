import 'identity.dart';
import 'scope.dart';

A? Function(B?) lift<A, B>(A? Function(B) f) => (B? b) => b?.let(f);

A? catches<A>(A? Function() a) {
  try {
    return a();
  } on Exception {
    return null;
  }
}

C? map2<A, B, C extends Object>(
  A? a,
  B? b,
  C? Function(A, B) f,
) {
  if (a == null || b == null) return null;
  return f(a, b);
}

List<B>? traverse<A extends Object, B extends Object>(
  List<A?> xa,
  B? Function(A) f,
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

List<A>? sequence<A extends Object>(List<A?> xs) => traverse(xs, identity);
