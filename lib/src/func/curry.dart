import '../func.dart';

Func1<A, Func1<B, C>> curry<A, B, C>(Func2<A, B, C> f) => _curry(f);

Func2<A, B, C> uncurry<A, B, C>(Func1<A, Func1<B, C>> f) => _uncurry(f);

extension Curry<A, B, C> on Func2<A, B, C> {
  Func1<A, Func1<B, C>> curry() => _curry(this);
}

extension Uncurry<A, B, C> on Func1<A, Func1<B, C>> {
  Func2<A, B, C> uncurry() => _uncurry(this);
}

Func1<A, Func1<B, C>> _curry<A, B, C>(Func2<A, B, C> f) =>
    (a) => (b) => f(a, b);

Func2<A, B, C> _uncurry<A, B, C>(Func1<A, Func1<B, C>> f) => (a, b) => f(a)(b);
