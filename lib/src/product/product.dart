import 'package:quiver/core.dart';

abstract class Product0 {
  const Product0();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(other) => other is Product0;
}

abstract class Product1<T1> {
  const Product1();

  T1 get item1;

  @override
  int get hashCode => item1.hashCode;

  @override
  bool operator ==(other) => other is Product1 && other.item1 == item1;
}

abstract class Product2<T1, T2> {
  const Product2();

  T1 get item1;

  T2 get item2;

  @override
  int get hashCode => hash2(item1, item2);

  @override
  bool operator ==(other) =>
      other is Product2 && other.item1 == item1 && other.item2 == item2;
}

abstract class Product3<T1, T2, T3> {
  const Product3();

  T1 get item1;

  T2 get item2;

  T3 get item3;

  @override
  int get hashCode => hash3(item1, item2, item3);

  @override
  bool operator ==(other) =>
      other is Product3 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3;
}

abstract class Product4<T1, T2, T3, T4> {
  const Product4();

  T1 get item1;

  T2 get item2;

  T3 get item3;

  T4 get item4;

  @override
  int get hashCode => hashObjects([item1, item2, item3, item4]);

  @override
  bool operator ==(other) =>
      other is Product4 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3 &&
      other.item4 == item4;
}

abstract class Product5<T1, T2, T3, T4, T5> {
  const Product5();

  T1 get item1;

  T2 get item2;

  T3 get item3;

  T4 get item4;

  T5 get item5;

  @override
  int get hashCode => hashObjects([item1, item2, item3, item4, item5]);

  @override
  bool operator ==(other) =>
      other is Product5 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3 &&
      other.item4 == item4 &&
      other.item5 == item5;
}
