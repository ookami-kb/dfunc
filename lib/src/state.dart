import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/product/product.dart';

typedef State<S, A> = Product2<A, S> Function(S);

abstract class States {
  States._();

  static State<S, A> unit<S, A>(A a) => (s) => Product2(a, s);

  static State<S, C> map2<S, A, B, C>(
    State<S, A> sa,
    State<S, B> sb,
    Func2<A, B, C> f,
  ) =>
      (s1) {
        final s2 = sa(s1);
        final s3 = sb(s2.item2);

        return Product2(f(s2.item1, s3.item1), s3.item2);
      };
}

extension StateExt<S, A> on State<S, A> {
  State<S, B> map<B>(Func1<A, B> f) => (s1) {
        final s2 = this(s1);

        return Product2(f(s2.item1), s2.item2);
      };

  State<S, B> flatMap<B>(Func1<A, State<S, B>> f) => (s1) {
        final s2 = this(s1);

        return f(s2.item1)(s2.item2);
      };
}

extension StateExtIterable<S, A> on Iterable<State<S, A>> {
  State<S, Iterable<A>> sequence() => (s) {
        final r = <A>[];
        var x = s;
        for (final a in this) {
          final s2 = a(x);
          r.add(s2.item1);
          x = s2.item2;
        }

        return Product2(r, x);
      };
}

State<S, B> map<S, A, B>(State<S, A> s, Func1<A, B> f) => s.map(f);

State<S, Iterable<A>> sequence<S, A>(Iterable<State<S, A>> ss) => ss.sequence();

State<S, B> flatMap<S, A, B>(State<S, A> s, Func1<A, State<S, B>> f) =>
    s.flatMap(f);
