import 'package:dfunc/src/coproduct/coproduct.dart';

abstract class Union {
  static Union0 empty() => Union0.empty();

  Union._(this._discriminator);

  final int _discriminator;
}

class Union0 extends Union implements Coproduct0 {
  static Union0 empty() => Union0._();

  Union0._() : super._(0);
}

class Union1<T1> extends Union implements Coproduct1<T1> {
  final T1 value1;

  static Union1<T1> first<T1>(T1 value) => Union1._(value);

  Union1._(this.value1) : super._(1);

  @override
  R match<R>(R Function(T1) ifFirst) => ifFirst(value1);
}

class Union2<T1, T2> extends Union implements Coproduct2<T1, T2> {
  static Union2<T1, T2> first<T1, T2>(T1 value) => Union2._(1, value, null);

  static Union2<T1, T2> second<T1, T2>(T2 value) => Union2._(2, null, value);

  final T1 _value1;
  final T2 _value2;

  Union2._(int discriminator, this._value1, this._value2)
      : super._(discriminator);

  @override
  R match<R>(R Function(T1) ifFirst, R Function(T2) ifSecond) {
    switch (_discriminator) {
      case 1:
        return ifFirst(_value1);
      case 2:
        return ifSecond(_value2);
    }
  }
}

class Union3<T1, T2, T3> extends Union implements Coproduct3<T1, T2, T3> {
  static Union3<T1, T2, T3> first<T1, T2, T3>(T1 value) =>
      Union3._(1, value, null, null);

  static Union3<T1, T2, T3> second<T1, T2, T3>(T2 value) =>
      Union3._(2, null, value, null);

  static Union3<T1, T2, T3> third<T1, T2, T3>(T3 value) =>
      Union3._(2, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;

  Union3._(int discriminator, this._value1, this._value2, this._value3)
      : super._(discriminator);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
  ) {
    switch (_discriminator) {
      case 1:
        return ifFirst(_value1);
      case 2:
        return ifSecond(_value2);
      case 3:
        return ifThird(_value3);
    }
  }
}

class Union4<T1, T2, T3, T4> extends Union
    implements Coproduct4<T1, T2, T3, T4> {
  static Union4<T1, T2, T3, T4> first<T1, T2, T3, T4>(T1 value) =>
      Union4._(1, value, null, null, null);

  static Union4<T1, T2, T3, T4> second<T1, T2, T3, T4>(T2 value) =>
      Union4._(2, null, value, null, null);

  static Union4<T1, T2, T3, T4> third<T1, T2, T3, T4>(T3 value) =>
      Union4._(2, null, null, value, null);

  static Union4<T1, T2, T3, T4> fourth<T1, T2, T3, T4>(T4 value) =>
      Union4._(2, null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;

  Union4._(
    int discriminator,
    this._value1,
    this._value2,
    this._value3,
    this._value4,
  ) : super._(discriminator);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
  ) {
    switch (_discriminator) {
      case 1:
        return ifFirst(_value1);
      case 2:
        return ifSecond(_value2);
      case 3:
        return ifThird(_value3);
      case 4:
        return ifFourth(_value4);
    }
  }
}

class Union5<T1, T2, T3, T4, T5> extends Union
    implements Coproduct5<T1, T2, T3, T4, T5> {
  static Union5<T1, T2, T3, T4, T5> first<T1, T2, T3, T4, T5>(T1 value) =>
      Union5._(1, value, null, null, null, null);

  static Union5<T1, T2, T3, T4, T5> second<T1, T2, T3, T4, T5>(T2 value) =>
      Union5._(2, null, value, null, null, null);

  static Union5<T1, T2, T3, T4, T5> third<T1, T2, T3, T4, T5>(T3 value) =>
      Union5._(2, null, null, value, null, null);

  static Union5<T1, T2, T3, T4, T5> fourth<T1, T2, T3, T4, T5>(T4 value) =>
      Union5._(2, null, null, null, value, null);

  static Union5<T1, T2, T3, T4, T5> fifth<T1, T2, T3, T4, T5>(T5 value) =>
      Union5._(2, null, null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final T5 _value5;

  Union5._(
    int discriminator,
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
  ) : super._(discriminator);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
    R Function(T5) ifFifth,
  ) {
    switch (_discriminator) {
      case 1:
        return ifFirst(_value1);
      case 2:
        return ifSecond(_value2);
      case 3:
        return ifThird(_value3);
      case 4:
        return ifFourth(_value4);
      case 5:
        return ifFifth(_value5);
    }
  }
}
