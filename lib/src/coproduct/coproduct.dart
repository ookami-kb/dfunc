import 'package:dfunc/dfunc.dart';
import 'package:quiver/core.dart';

class Coproduct0 {
  const Coproduct0.empty();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(other) => other is Coproduct0;

  @override
  String toString() => [].toCoproductString();
}

class Coproduct1<T1> {
  final T1 _value1;

  const Coproduct1.item1(T1 value) : this._(value);

  const Coproduct1._(this._value1) : assert(_value1 != null);

  R fold<R>(Func1<T1, R> match1) => match1(_value1);

  @override
  int get hashCode => _value1.hashCode;

  @override
  bool operator ==(other) => other is Coproduct1 && other._value1 == _value1;

  @override
  String toString() => [_value1].toCoproductString();
}

class Coproduct2<T1, T2> {
  const Coproduct2.item1(T1 value) : this._(value, null, 0);

  const Coproduct2.item2(T2 value) : this._(null, value, 1);

  final T1 _value1;
  final T2 _value2;
  final int _discriminator;

  const Coproduct2._(this._value1, this._value2, this._discriminator);

  R fold<R>(R Function(T1) match1, R Function(T2) match2) {
    switch (_discriminator) {
      case 0:
        return match1(_value1);
      default:
        return match2(_value2);
    }
  }

  @override
  int get hashCode => hash2(_value1, _value2);

  @override
  bool operator ==(other) =>
      other is Coproduct2 &&
      other._value1 == _value1 &&
      other._value2 == _value2;

  @override
  String toString() => [_value1, _value2].toCoproductString();
}

class Coproduct3<T1, T2, T3> {
  const Coproduct3.item1(T1 value) : this._(value, null, null, 0);

  const Coproduct3.item2(T2 value) : this._(null, value, null, 1);

  const Coproduct3.item3(T3 value) : this._(null, null, value, 2);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final int _discriminator;

  const Coproduct3._(
    this._value1,
    this._value2,
    this._value3,
    this._discriminator,
  );

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1);
      case 1:
        return match2(_value2);
      default:
        return match3(_value3);
    }
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
  String toString() => [_value1, _value2, _value3].toCoproductString();
}

class Coproduct4<T1, T2, T3, T4> {
  const Coproduct4.item1(T1 value) : this._(value, null, null, null, 0);

  const Coproduct4.item2(T2 value) : this._(null, value, null, null, 1);

  const Coproduct4.item3(T3 value) : this._(null, null, value, null, 2);

  const Coproduct4.item4(T4 value) : this._(null, null, null, value, 3);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final int _discriminator;

  const Coproduct4._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._discriminator,
  );

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1);
      case 1:
        return match2(_value2);
      case 2:
        return match3(_value3);
      default:
        return match4(_value4);
    }
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
  String toString() => [_value1, _value2, _value3, _value4].toCoproductString();
}

class Coproduct5<T1, T2, T3, T4, T5> {
  const Coproduct5.item1(T1 value) : this._(value, null, null, null, null, 0);

  const Coproduct5.item2(T2 value) : this._(null, value, null, null, null, 1);

  const Coproduct5.item3(T3 value) : this._(null, null, value, null, null, 2);

  const Coproduct5.item4(T4 value) : this._(null, null, null, value, null, 3);

  const Coproduct5.item5(T5 value) : this._(null, null, null, null, value, 4);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final T5 _value5;
  final int _discriminator;

  const Coproduct5._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._discriminator,
  );

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1);
      case 1:
        return match2(_value2);
      case 2:
        return match3(_value3);
      case 3:
        return match4(_value4);
      default:
        return match5(_value5);
    }
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
      [_value1, _value2, _value3, _value4, _value5].toCoproductString();
}

class Coproduct6<T1, T2, T3, T4, T5, T6> {
  const Coproduct6.item1(T1 value)
      : this._(value, null, null, null, null, null, 0);

  const Coproduct6.item2(T2 value)
      : this._(null, value, null, null, null, null, 1);

  const Coproduct6.item3(T3 value)
      : this._(null, null, value, null, null, null, 2);

  const Coproduct6.item4(T4 value)
      : this._(null, null, null, value, null, null, 3);

  const Coproduct6.item5(T5 value)
      : this._(null, null, null, null, value, null, 4);

  const Coproduct6.item6(T6 value)
      : this._(null, null, null, null, null, value, 5);

  final T1 _value1;
  final T2 _value2;
  final T3 _value3;
  final T4 _value4;
  final T5 _value5;
  final T6 _value6;
  final int _discriminator;

  const Coproduct6._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._discriminator,
  );

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
    R Function(T6) match6,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1);
      case 1:
        return match2(_value2);
      case 2:
        return match3(_value3);
      case 3:
        return match4(_value4);
      case 4:
        return match5(_value5);
      default:
        return match6(_value6);
    }
  }

  @override
  int get hashCode =>
      hashObjects([_value1, _value2, _value3, _value4, _value5, _value6]);

  @override
  bool operator ==(other) =>
      other is Coproduct6 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5 &&
      other._value6 == _value6;

  @override
  String toString() => [_value1, _value2, _value3, _value4, _value5, _value6]
      .toCoproductString();
}

extension on Iterable<Object> {
  String toCoproductString() =>
      '(${firstWhere((e) => e != null, orElse: () => '').toString()})';
}
