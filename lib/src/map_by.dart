import 'package:dfunc/src/func.dart';
import 'package:dfunc/src/utils.dart';

/// Creates map from [items]. Keys of the map are created by
/// applying [getKey] function to the corresponding item of the list.
Map<K, V> mapBy<K, V>(Func1<V, K> getKey, Iterable<V> items) =>
    _mapBy(getKey, items);

extension MapBy<V> on Iterable<V> {
  /// Creates map from current iterable. Keys of the map are created by
  /// applying [getKey] function to the corresponding item of the list.
  Map<K, V> mapBy<K>(Func1<V, K> getKey) => _mapBy(getKey, this);
}

Map<K, V> _mapBy<K, V>(Func1<V, K> getKey, Iterable<V> items) => items
    .toListOrThis()
    .asMap()
    .map((_, value) => MapEntry(getKey(value), value));
