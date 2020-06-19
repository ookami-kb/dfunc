class Coproduct0 {
  const Coproduct0.empty();
}

class Coproduct1<T1> {
  final T1 value1;

  const Coproduct1.item1(T1 value) : this._(value);

  const Coproduct1._(this.value1) : assert(value1 != null);

  R fold<R>(R Function(T1) ifFirst) => ifFirst(value1);
}

class Coproduct2<T1, T2> {
  const Coproduct2.item1(T1 value) : this._(value, null);

  const Coproduct2.item2(T2 value) : this._(null, value);

  final T1 _value1;
  final T2 _value2;

  const Coproduct2._(this._value1, this._value2)
      : assert(_value1 != null || _value2 != null);

  R fold<R>(R Function(T1) ifFirst, R Function(T2) ifSecond) {
    if (_value1 != null) return ifFirst(_value1);
    return ifSecond(_value2);
  }
}

class Coproduct3<T1, T2, T3> {
  const Coproduct3.item1(T1 value) : this._(value, null, null);

  const Coproduct3.item2(T2 value) : this._(null, value, null);

  const Coproduct3.item3(T3 value) : this._(null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;

  const Coproduct3._(this._value1, this._value2, this._value3)
      : assert(_value1 != null || _value2 != null || _value3 != null);

  R fold<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
  ) {
    if (_value1 != null) return ifFirst(_value1);
    if (_value2 != null) ifSecond(_value2);
    return ifThird(_value3);
  }
}

class Coproduct4<T1, T2, T3, T4> {
  const Coproduct4.item1(T1 value) : this._(value, null, null, null);

  const Coproduct4.item2(T2 value) : this._(null, value, null, null);

  const Coproduct4.item3(T3 value) : this._(null, null, value, null);

  const Coproduct4.item4(T4 value) : this._(null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;

  const Coproduct4._(this._value1, this._value2, this._value3, this._value4)
      : assert(_value1 != null ||
            _value2 != null ||
            _value3 != null ||
            _value4 != null);

  R fold<R>(
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

class Coproduct5<T1, T2, T3, T4, T5> {
  const Coproduct5.item1(T1 value) : this._(value, null, null, null, null);

  const Coproduct5.item2(T2 value) : this._(null, value, null, null, null);

  const Coproduct5.item3(T3 value) : this._(null, null, value, null, null);

  const Coproduct5.item4(T4 value) : this._(null, null, null, value, null);

  const Coproduct5.item5(T5 value) : this._(null, null, null, null, value);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final T5 _value5;

  const Coproduct5._(
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

  R fold<R>(
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
