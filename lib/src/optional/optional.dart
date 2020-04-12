class Optional<T> {
  const Optional._(this._value);

  const Optional.of(T value) : this._(value);

  const Optional.empty() : this._(null);

  Optional.some(T value) : _value = value {
    if (_value == null) throw ArgumentError('Must not be null.');
  }

  final T _value;

  bool isEmpty() => _value == null;

  T get() => _value == null
      ? throw StateError('get() called on empty Optional.')
      : _value;

  T getOrNull() => _value;

  T getOrElse(T Function() ifEmpty) => _value == null ? ifEmpty() : _value;

  Optional<U> map<U>(U Function(T) f) =>
      _value == null ? Optional.empty() : Optional.of(f(_value));

  Optional<U> flatMap<U>(Optional<U> Function(T) f) =>
      _value == null ? Optional.empty() : f(_value);

  Optional<T> where(bool Function(T) predicate) =>
      map((v) => predicate(v) ? v : null);

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(other) => other is Optional<T> && _value == other._value;

  @override
  String toString() =>
      _value == null ? 'Optional(empty)' : 'Optional(value: $_value)';
}
