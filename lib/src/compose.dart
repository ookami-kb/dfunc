import 'package:dfunc/src/func.dart';

extension Compose<B, C> on Func1<B, C> {
  /// Performs right-to-left function composition
  Func1<A, C> compose<A>(Func1<A, B> f) => (A a) => this(f(a));
}
