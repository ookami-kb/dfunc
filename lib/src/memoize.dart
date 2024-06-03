/// {@template dfunc.memoize}
/// The `memoize` function is used to cache the results of expensive function
/// calls and return the cached result when the same inputs are provided again.
///
/// Usage:
///
/// ```dart
/// final memoized = memoize(expensiveFunction);
/// final result = memoized(arg);
/// ```
/// {@endtemplate}
Memoize<A, B> memoize<A, B>(
  A Function(B lastArgument) f, {
  int? capacity,
}) =>
    Memoize<A, B>(f, capacity: capacity);

/// {@macro dfunc.memoize}
class Memoize<A, B> {
  /// {@macro dfunc.memoize}
  Memoize(this._f, {int? capacity}) : _capacity = capacity;

  final Map<B, A> _cache = {};

  final A Function(B lastArgument) _f;
  final int? _capacity;

  /// Returns the cached value for the argument [b] if it exists, otherwise
  /// computes the value using the function [_f] and caches it.
  A call(B b) {
    if (_cache.containsKey(b)) return _cache[b] as A;

    final value = _f(b);
    _cache[b] = value;

    // ignore: avoid-non-null-assertion, checked for null
    if (_capacity != null && _cache.length > _capacity!) {
      _cache.remove(_cache.keys.first);
    }

    return value;
  }

  /// Clears the memoization cache, subsequent call with the same argument will
  /// recompute the value.
  void reset() => _cache.clear();
}
