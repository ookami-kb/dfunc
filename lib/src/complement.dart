import 'package:dfunc/src/func/predicate.dart';

/// Takes a function `f` and returns a function `g` such that if called with
/// the same argument when `f` returns `true`, g returns `false` and when
/// `f` returns a `false` `g` returns `true`.
Predicate<A> complement<A>(Predicate<A> f) => (A arg) => !f(arg);
