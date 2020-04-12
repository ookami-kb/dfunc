import 'package:dfunc/src/coproduct/coproduct.dart';

class Union0 extends Coproduct0 {
  const Union0.empty() : this._();

  const Union0._();
}

class Union1<T1> extends Coproduct1<T1> {
  final T1 value1;

  const Union1.first(T1 value) : this._(value);

  const Union1._(this.value1) : assert(value1 != null);

  @override
  R match<R>(R Function(T1) ifFirst) => ifFirst(value1);
}

class Union2<T1, T2> extends Coproduct2<T1, T2> {
  const Union2.first(T1 value) : this._(value, null);

  const Union2.second(T2 value) : this._(null, value);

  final T1 _value1;
  final T2 _value2;

  const Union2._(this._value1, this._value2)
      : assert(_value1 != null || _value2 != null);

  @override
  R match<R>(R Function(T1) ifFirst, R Function(T2) ifSecond) {
    if (_value1 != null) return ifFirst(_value1);
    return ifSecond(_value2);
  }
}

class Union3<T1, T2, T3> extends Coproduct3<T1, T2, T3> {
  const Union3.first(T1 value) : this._(value, null, null);

  const Union3.second(T2 value) : this._(null, value, null);

  const Union3.third(T3 value) : this._(null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;

  const Union3._(this._value1, this._value2, this._value3)
      : assert(_value1 != null || _value2 != null || _value3 != null);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
  ) {
    if (_value1 != null) return ifFirst(_value1);
    if (_value2 != null) ifSecond(_value2);
    return ifThird(_value3);
  }
}

class Union4<T1, T2, T3, T4> extends Coproduct4<T1, T2, T3, T4> {
  const Union4.first(T1 value) : this._(value, null, null, null);

  const Union4.second(T2 value) : this._(null, value, null, null);

  const Union4.third(T3 value) : this._(null, null, value, null);

  const Union4.fourth(T4 value) : this._(null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;

  const Union4._(this._value1, this._value2, this._value3, this._value4)
      : assert(_value1 != null ||
            _value2 != null ||
            _value3 != null ||
            _value4 != null);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
  ) {
    if (_value1 != null) return ifFirst(_value1);
    if (_value2 != null) ifSecond(_value2);
    if (_value3 != null) ifThird(_value3);
    return ifFourth(_value4);
  }
}

class Union5<T1, T2, T3, T4, T5> extends Coproduct5<T1, T2, T3, T4, T5> {
  const Union5.first(T1 value) : this._(value, null, null, null, null);

  const Union5.second(T2 value) : this._(null, value, null, null, null);

  const Union5.third(T3 value) : this._(null, null, value, null, null);

  const Union5.fourth(T4 value) : this._(null, null, null, value, null);

  const Union5.fifth(T5 value) : this._(null, null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final T5 _value5;

  const Union5._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
  ) : assert(_value1 != null ||
            _value2 != null ||
            _value3 != null ||
            _value4 != null ||
            _value5 != null);

  @override
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
    R Function(T5) ifFifth,
  ) {
    if (_value1 != null) return ifFirst(_value1);
    if (_value2 != null) ifSecond(_value2);
    if (_value3 != null) ifThird(_value3);
    if (_value4 != null) ifFourth(_value4);
    return ifFifth(_value5);
  }
}
