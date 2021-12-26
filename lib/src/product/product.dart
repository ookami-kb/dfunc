class Product0 {
  const Product0();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is Product0;

  @override
  String toString() => <dynamic>[].toProductString();
}

class Product1<T1> {
  const Product1(this.item1);

  final T1 item1;

  @override
  int get hashCode => item1.hashCode;

  @override
  bool operator ==(Object other) => other is Product1 && other.item1 == item1;

  @override
  String toString() => [item1].toProductString();
}

class Product2<T1, T2> {
  const Product2(this.item1, this.item2);

  final T1 item1;

  final T2 item2;

  @override
  int get hashCode => Object.hash(item1, item2);

  @override
  bool operator ==(Object other) =>
      other is Product2 && other.item1 == item1 && other.item2 == item2;

  @override
  String toString() => [item1, item2].toProductString();
}

class Product3<T1, T2, T3> {
  const Product3(this.item1, this.item2, this.item3);

  final T1 item1;

  final T2 item2;

  final T3 item3;

  @override
  int get hashCode => Object.hash(item1, item2, item3);

  @override
  bool operator ==(Object other) =>
      other is Product3 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3;

  @override
  String toString() => [item1, item2, item3].toProductString();
}

class Product4<T1, T2, T3, T4> {
  const Product4(this.item1, this.item2, this.item3, this.item4);

  final T1 item1;

  final T2 item2;

  final T3 item3;

  final T4 item4;

  @override
  int get hashCode => Object.hash(item1, item2, item3, item4);

  @override
  bool operator ==(Object other) =>
      other is Product4 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3 &&
      other.item4 == item4;

  @override
  String toString() => [item1, item2, item3, item4].toProductString();
}

class Product5<T1, T2, T3, T4, T5> {
  const Product5(this.item1, this.item2, this.item3, this.item4, this.item5);

  final T1 item1;

  final T2 item2;

  final T3 item3;

  final T4 item4;

  final T5 item5;

  @override
  int get hashCode => Object.hash(item1, item2, item3, item4, item5);

  @override
  bool operator ==(Object other) =>
      other is Product5 &&
      other.item1 == item1 &&
      other.item2 == item2 &&
      other.item3 == item3 &&
      other.item4 == item4 &&
      other.item5 == item5;

  @override
  String toString() => [item1, item2, item3, item4, item5].toProductString();
}

extension<T> on Iterable<T> {
  String toProductString() => '(${map((e) => e.toString()).join(', ')})';
}
