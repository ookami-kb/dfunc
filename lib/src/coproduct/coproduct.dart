import 'package:dfunc/dfunc.dart';
import 'package:dfunc/src/utils/hash.dart';

class Coproduct0 {
  const Coproduct0.empty();

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is Coproduct0;

  @override
  String toString() => <dynamic>[].toCoproductString();
}

class Coproduct1<T1> {
  const Coproduct1.item1(T1 value) : this._(value);

  const Coproduct1._(this._value1);

  final T1 _value1;

  R fold<R>(Func1<T1, R> match1) => match1(_value1);

  @override
  int get hashCode => _value1.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Coproduct1 && other._value1 == _value1;

  @override
  String toString() => [_value1].toCoproductString();
}

class Coproduct2<T1, T2> {
  const Coproduct2.item1(T1 value) : this._(value, null, 0);

  const Coproduct2.item2(T2 value) : this._(null, value, 1);

  const Coproduct2._(this._value1, this._value2, this._discriminator);

  final T1? _value1;
  final T2? _value2;

  final int _discriminator;

  R fold<R>(R Function(T1) match1, R Function(T2) match2) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      default:
        return match2(_value2!);
    }
  }

  @override
  int get hashCode => hash2(_value1, _value2);

  @override
  bool operator ==(Object other) =>
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

  const Coproduct3._(
    this._value1,
    this._value2,
    this._value3,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      default:
        return match3(_value3!);
    }
  }

  @override
  int get hashCode => hash3(_value1, _value2, _value3);

  @override
  bool operator ==(Object other) =>
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

  const Coproduct4._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      default:
        return match4(_value4!);
    }
  }

  @override
  int get hashCode =>
      hashObjects(<dynamic>[_value1, _value2, _value3, _value4]);

  @override
  bool operator ==(Object other) =>
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

  const Coproduct5._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      default:
        return match5(_value5!);
    }
  }

  @override
  int get hashCode =>
      hashObjects(<dynamic>[_value1, _value2, _value3, _value4, _value5]);

  @override
  bool operator ==(Object other) =>
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

  const Coproduct6._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;
  final T6? _value6;

  final int _discriminator;

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
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      case 4:
        return match5(_value5!);
      default:
        return match6(_value6!);
    }
  }

  @override
  int get hashCode => hashObjects(
      <dynamic>[_value1, _value2, _value3, _value4, _value5, _value6]);

  @override
  bool operator ==(Object other) =>
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

class Coproduct7<T1, T2, T3, T4, T5, T6, T7> {
  const Coproduct7.item1(T1 value)
      : this._(value, null, null, null, null, null, null, 0);

  const Coproduct7.item2(T2 value)
      : this._(null, value, null, null, null, null, null, 1);

  const Coproduct7.item3(T3 value)
      : this._(null, null, value, null, null, null, null, 2);

  const Coproduct7.item4(T4 value)
      : this._(null, null, null, value, null, null, null, 3);

  const Coproduct7.item5(T5 value)
      : this._(null, null, null, null, value, null, null, 4);

  const Coproduct7.item6(T6 value)
      : this._(null, null, null, null, null, value, null, 5);

  const Coproduct7.item7(T7 value)
      : this._(null, null, null, null, null, null, value, 6);

  const Coproduct7._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._value7,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;
  final T6? _value6;
  final T7? _value7;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
    R Function(T6) match6,
    R Function(T7) match7,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      case 4:
        return match5(_value5!);
      case 5:
        return match6(_value6!);
      default:
        return match7(_value7!);
    }
  }

  @override
  int get hashCode => hashObjects(<dynamic>[
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
      ]);

  @override
  bool operator ==(Object other) =>
      other is Coproduct7 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5 &&
      other._value6 == _value6 &&
      other._value7 == _value7;

  @override
  String toString() => [
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
      ].toCoproductString();
}

class Coproduct8<T1, T2, T3, T4, T5, T6, T7, T8> {
  const Coproduct8.item1(T1 value)
      : this._(value, null, null, null, null, null, null, null, 0);

  const Coproduct8.item2(T2 value)
      : this._(null, value, null, null, null, null, null, null, 1);

  const Coproduct8.item3(T3 value)
      : this._(null, null, value, null, null, null, null, null, 2);

  const Coproduct8.item4(T4 value)
      : this._(null, null, null, value, null, null, null, null, 3);

  const Coproduct8.item5(T5 value)
      : this._(null, null, null, null, value, null, null, null, 4);

  const Coproduct8.item6(T6 value)
      : this._(null, null, null, null, null, value, null, null, 5);

  const Coproduct8.item7(T7 value)
      : this._(null, null, null, null, null, null, value, null, 6);

  const Coproduct8.item8(T8 value)
      : this._(null, null, null, null, null, null, null, value, 7);

  const Coproduct8._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._value7,
    this._value8,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;
  final T6? _value6;
  final T7? _value7;
  final T8? _value8;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
    R Function(T6) match6,
    R Function(T7) match7,
    R Function(T8) match8,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      case 4:
        return match5(_value5!);
      case 5:
        return match6(_value6!);
      case 6:
        return match7(_value7!);
      default:
        return match8(_value8!);
    }
  }

  @override
  int get hashCode => hashObjects(<dynamic>[
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
      ]);

  @override
  bool operator ==(Object other) =>
      other is Coproduct8 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5 &&
      other._value6 == _value6 &&
      other._value7 == _value7 &&
      other._value8 == _value8;

  @override
  String toString() => [
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
      ].toCoproductString();
}

class Coproduct9<T1, T2, T3, T4, T5, T6, T7, T8, T9> {
  const Coproduct9.item1(T1 value)
      : this._(value, null, null, null, null, null, null, null, null, 0);

  const Coproduct9.item2(T2 value)
      : this._(null, value, null, null, null, null, null, null, null, 1);

  const Coproduct9.item3(T3 value)
      : this._(null, null, value, null, null, null, null, null, null, 2);

  const Coproduct9.item4(T4 value)
      : this._(null, null, null, value, null, null, null, null, null, 3);

  const Coproduct9.item5(T5 value)
      : this._(null, null, null, null, value, null, null, null, null, 4);

  const Coproduct9.item6(T6 value)
      : this._(null, null, null, null, null, value, null, null, null, 5);

  const Coproduct9.item7(T7 value)
      : this._(null, null, null, null, null, null, value, null, null, 6);

  const Coproduct9.item8(T8 value)
      : this._(null, null, null, null, null, null, null, value, null, 7);

  const Coproduct9.item9(T9 value)
      : this._(null, null, null, null, null, null, null, null, value, 8);

  const Coproduct9._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._value7,
    this._value8,
    this._value9,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;
  final T6? _value6;
  final T7? _value7;
  final T8? _value8;
  final T9? _value9;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
    R Function(T6) match6,
    R Function(T7) match7,
    R Function(T8) match8,
    R Function(T9) match9,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      case 4:
        return match5(_value5!);
      case 5:
        return match6(_value6!);
      case 6:
        return match7(_value7!);
      case 7:
        return match8(_value8!);
      default:
        return match9(_value9!);
    }
  }

  @override
  int get hashCode => hashObjects(<dynamic>[
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
        _value9,
      ]);

  @override
  bool operator ==(Object other) =>
      other is Coproduct9 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5 &&
      other._value6 == _value6 &&
      other._value7 == _value7 &&
      other._value8 == _value8 &&
      other._value9 == _value9;

  @override
  String toString() => [
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
        _value9,
      ].toCoproductString();
}

class Coproduct10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
  const Coproduct10.item1(T1 value)
      : this._(value, null, null, null, null, null, null, null, null, null, 0);

  const Coproduct10.item2(T2 value)
      : this._(null, value, null, null, null, null, null, null, null, null, 1);

  const Coproduct10.item3(T3 value)
      : this._(null, null, value, null, null, null, null, null, null, null, 2);

  const Coproduct10.item4(T4 value)
      : this._(null, null, null, value, null, null, null, null, null, null, 3);

  const Coproduct10.item5(T5 value)
      : this._(null, null, null, null, value, null, null, null, null, null, 4);

  const Coproduct10.item6(T6 value)
      : this._(null, null, null, null, null, value, null, null, null, null, 5);

  const Coproduct10.item7(T7 value)
      : this._(null, null, null, null, null, null, value, null, null, null, 6);

  const Coproduct10.item8(T8 value)
      : this._(null, null, null, null, null, null, null, value, null, null, 7);

  const Coproduct10.item9(T9 value)
      : this._(null, null, null, null, null, null, null, null, value, null, 8);

  const Coproduct10.item10(T10 value)
      : this._(null, null, null, null, null, null, null, null, null, value, 9);

  const Coproduct10._(
    this._value1,
    this._value2,
    this._value3,
    this._value4,
    this._value5,
    this._value6,
    this._value7,
    this._value8,
    this._value9,
    this._value10,
    this._discriminator,
  );

  final T1? _value1;
  final T2? _value2;
  final T3? _value3;
  final T4? _value4;
  final T5? _value5;
  final T6? _value6;
  final T7? _value7;
  final T8? _value8;
  final T9? _value9;
  final T10? _value10;

  final int _discriminator;

  R fold<R>(
    R Function(T1) match1,
    R Function(T2) match2,
    R Function(T3) match3,
    R Function(T4) match4,
    R Function(T5) match5,
    R Function(T6) match6,
    R Function(T7) match7,
    R Function(T8) match8,
    R Function(T9) match9,
    R Function(T10) match10,
  ) {
    switch (_discriminator) {
      case 0:
        return match1(_value1!);
      case 1:
        return match2(_value2!);
      case 2:
        return match3(_value3!);
      case 3:
        return match4(_value4!);
      case 4:
        return match5(_value5!);
      case 5:
        return match6(_value6!);
      case 6:
        return match7(_value7!);
      case 7:
        return match8(_value8!);
      case 8:
        return match9(_value9!);
      default:
        return match10(_value10!);
    }
  }

  @override
  int get hashCode => hashObjects(<dynamic>[
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
        _value9,
        _value10,
      ]);

  @override
  bool operator ==(Object other) =>
      other is Coproduct10 &&
      other._value1 == _value1 &&
      other._value2 == _value2 &&
      other._value3 == _value3 &&
      other._value4 == _value4 &&
      other._value5 == _value5 &&
      other._value6 == _value6 &&
      other._value7 == _value7 &&
      other._value8 == _value8 &&
      other._value9 == _value9 &&
      other._value10 == _value10;

  @override
  String toString() => [
        _value1,
        _value2,
        _value3,
        _value4,
        _value5,
        _value6,
        _value7,
        _value8,
        _value9,
        _value10,
      ].toCoproductString();
}

extension<T> on Iterable<T?> {
  String toCoproductString() =>
      '(${firstWhere((e) => e != null, orElse: () => null)?.toString() ?? ''})';
}
