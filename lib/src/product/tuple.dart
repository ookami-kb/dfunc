import 'package:dfunc/src/product/product.dart';

class Tuple0 extends Product0 {
  const Tuple0();
}

class Tuple1<T1> extends Product1<T1> {
  const Tuple1(this.item1);

  @override
  final T1 item1;
}

class Tuple2<T1, T2> extends Product2<T1, T2> {
  const Tuple2(this.item1, this.item2);

  @override
  final T1 item1;

  @override
  final T2 item2;
}

class Tuple3<T1, T2, T3> extends Product3<T1, T2, T3> {
  const Tuple3(this.item1, this.item2, this.item3);

  @override
  final T1 item1;

  @override
  final T2 item2;

  @override
  final T3 item3;
}

class Tuple4<T1, T2, T3, T4> extends Product4<T1, T2, T3, T4> {
  const Tuple4(this.item1, this.item2, this.item3, this.item4);

  @override
  final T1 item1;

  @override
  final T2 item2;

  @override
  final T3 item3;

  @override
  final T4 item4;
}

class Tuple5<T1, T2, T3, T4, T5> extends Product5<T1, T2, T3, T4, T5> {
  const Tuple5(this.item1, this.item2, this.item3, this.item4, this.item5);

  @override
  final T1 item1;

  @override
  final T2 item2;

  @override
  final T3 item3;

  @override
  final T4 item4;

  @override
  final T5 item5;
}
