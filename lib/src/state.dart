import 'package:dfunc/src/func.dart';

typedef State<S, A> = (A, S) Function(S);

abstract class States {
  const States._();

  static State<S, A> unit<S, A>(A a) => (s) => (a, s);

  static State<S, C> map2<S, A, B, C>(
    State<S, A> sa,
    State<S, B> sb,
    Func2<A, B, C> f,
  ) =>
      (s1) {
        final s2 = sa(s1);
        final s3 = sb(s2.$2);

        return (f(s2.$1, s3.$1), s3.$2);
      };
}

extension StateExt<S, A> on State<S, A> {
  State<S, B> map<B>(Func1<A, B> f) => (s1) {
        final s2 = this(s1);

        return (f(s2.$1), s2.$2);
      };

  State<S, B> flatMap<B>(Func1<A, State<S, B>> f) => (s1) {
        final s2 = this(s1);

        return f(s2.$1)(s2.$2);
      };
}

extension StateExtIterable<S, A> on Iterable<State<S, A>> {
  State<S, Iterable<A>> sequence() => (s) {
        final r = <A>[];
        S x = s;
        for (final a in this) {
          final s2 = a(x);
          r.add(s2.$1);
          x = s2.$2;
        }

        return (r, x);
      };
}

State<S, B> map<S, A, B>(State<S, A> s, Func1<A, B> f) => s.map(f);

State<S, Iterable<A>> sequence<S, A>(Iterable<State<S, A>> ss) => ss.sequence();

State<S, B> flatMap<S, A, B>(State<S, A> s, Func1<A, State<S, B>> f) =>
    s.flatMap(f);
