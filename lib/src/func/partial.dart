import '../func.dart';

Func1<B, C> partial1<A, B, C>(A a, Func2<A, B, C> f) => _partial1(a, f);

extension Partial<A, B, C> on Func2<A, B, C> {
  Func1<B, C> partial1(A a) => _partial1(a, this);
}

Func1<B, C> _partial1<A, B, C>(A a, Func2<A, B, C> f) => (b) => f(a, b);
