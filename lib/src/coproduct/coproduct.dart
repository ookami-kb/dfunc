import 'package:quiver/core.dart';

class Coproduct0 {
  const Coproduct0.empty();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(other) => other is Coproduct0;

  @override
  String toString() => [].toCoProductString();
}

class Coproduct1<T1> {
  final T1 _value1;

  const Coproduct1.item1(T1 value) : this._(value);

  const Coproduct1._(this._value1) : assert(_value1 != null);

  R fold<R>(R Function(T1) match1) => match1(_value1);

  @override
  int get hashCode => _value1.hashCode;

  @override
  bool operator ==(other) => other is Coproduct1 && other._value1 == _value1;

  @override
  String toString() => [_value1].toCoProductString();
}

class Coproduct2<T1, T2> {
  const Coproduct2.item1(T1 value) : this._(value, null);

  const Coproduct2.item2(T2 value) : this._(null, value);

  final T1 _value1;
  final T2 _value2;

  const Coproduct2._(this._value1, this._value2)
      : assert(_value1 != null || _value2 != null);

  R fold<R>(R Function(T1) match1, R Function(T2) match2) {
    if (_value1 != null) return match1(_value1);
    return match2(_value2);
  }

  @override
  int get hashCode => hash2(_value1, _value2);

  @override
  bool operator ==(other) =>
      other is Coproduct2 &&
      other._value1 == _value1 &&
      other._value2 == _value2;

  @override
  String toString() => [_value1, _value2].toCoProductString();
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
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
  ) {
    if (_value1 != null) return match1(_value1);
    if (_value2 != null) match2(_value2);
    return match3(_value3);
  }

  @override
  int get hashCode => hash3(_value1, _value2, _value3);

  @override
  bool operator ==(other) =>
      other is Coproduct3 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3;

  @override
  String toString() => [_value1, _value2, _value3].toCoProductString();
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
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
  ) {
    if (_value1 != null) return match1(_value1);
    if (_value2 != null) match2(_value2);
    if (_value3 != null) match3(_value3);
    return match4(_value4);
  }

  @override
  int get hashCode => hashObjects([_value1, _value2, _value3, _value4]);

  @override
  bool operator ==(other) =>
      other is Coproduct4 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4;

  @override
  String toString() => [_value1, _value2, _value3, _value4].toCoProductString();
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
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
  ) {
    if (_value1 != null) return match1(_value1);
    if (_value2 != null) match2(_value2);
    if (_value3 != null) match3(_value3);
    if (_value4 != null) match4(_value4);
    return match5(_value5);
  }

  @override
  int get hashCode =>
      hashObjects([_value1, _value2, _value3, _value4, _value5]);

  @override
  bool operator ==(other) =>
      other is Coproduct5 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5;

  @override
  String toString() =>
      [_value1, _value2, _value3, _value4, _value5].toCoProductString();
}

extension on Iterable<Object> {
  String toCoProductString() =>
      '(${firstWhere((e) => e != null, orElse: () => '').toString()})';
}
