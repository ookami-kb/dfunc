import 'package:dfunc/dfunc.dart';

Iterable<Product2<A, B>> zip2<A, B>(Iterable<A> a, Iterable<B> b) sync* {
  final first = a.iterator;
  final second = b.iterator;
  while (first.moveNext() && second.moveNext()) {
    yield Tuple2(first.current, second.current);
  }
}

extension Zip<A> on Iterable<A> {
  Iterable<Product2<A, B>> zipWith<B>(Iterable<B> other) => zip2(this, other);
}
