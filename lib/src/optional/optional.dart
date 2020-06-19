import 'package:dfunc/src/func/functor.dart';
import 'package:dfunc/src/func/predicate.dart';

class Optional<A> implements Functor<Optional, A> {
  const Optional._(this._value);

  const Optional.of(A value) : this._(value);

  const Optional.empty() : this._(null);

  Optional.some(A value) : _value = value {
    if (_value == null) throw ArgumentError('Must not be null.');
  }

  final A _value;

  bool isEmpty() => _value == null;

  A getOrNull() => _value;

  A getOrElse(A Function() ifEmpty) => _value ?? ifEmpty();

  B fold<B>(B Function() ifEmpty, B Function(A) ifValue) =>
      _value == null ? ifEmpty() : ifValue(_value);

  @override
  Optional<B> map<B>(B Function(A) f) =>
      fold(empty, (A a) => Optional.of(f(a)));

  Optional<U> flatMap<U>(Optional<U> Function(A) f) => fold(empty, f);

  Optional<A> where(Predicate<A> predicate) =>
      map((v) => predicate(v) ? v : null);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is Optional<A> && _value == other._value;

  @override
  String toString() =>
      _value == null ? 'Optional(empty)' : 'Optional(value: $_value)';
}

Optional<A> empty<A>() => Optional<A>.empty();

Optional<A> some<A>(A a) => Optional<A>.some(a);
