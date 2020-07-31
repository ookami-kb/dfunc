import 'package:dfunc/src/func.dart';

/// Splits an iterable into sub-lists stored in a map, based on result
/// of calling [getKey] function on each element of [items], and grouping
/// the results according to values returned.
Map<K, List<V>> groupBy<K, V>(Func1<V, K> getKey, Iterable<V> items) =>
    _groupBy(getKey, items);

extension GroupBy<V> on Iterable<V> {
  /// Splits an iterable into sub-lists stored in a map, based on result
  /// of calling [getKey] function on each element of [this], and grouping
  /// the results according to values returned.
  Map<K, List<V>> groupBy<K>(Func1<V, K> getKey) => _groupBy(getKey, this);
}

Map<K, List<V>> _groupBy<K, V>(Func1<V, K> getKey, Iterable<V> items) =>
    items.fold(
      <K, List<V>>{},
      (Map<K, List<V>> map, V element) =>
          map..putIfAbsent(getKey(element), () => <V>[]).add(element),
    );
