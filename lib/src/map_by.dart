import 'package:dfunc/src/utils.dart';

/// Creates map from [items]. Keys of the map are created by
/// applying [getKey] function to the corresponding item of the list.
Map<K, V> mapBy<K, V>(K Function(V item) getKey, Iterable<V> items) =>
    _mapBy(getKey, items);

extension MapBy<V> on Iterable<V> {
  /// Creates map from current iterable. Keys of the map are created by
  /// applying [getKey] function to the corresponding item of the list.
  Map<K, V> mapBy<K>(K Function(V item) getKey) => _mapBy(getKey, this);
}

Map<K, V> _mapBy<K, V>(K Function(V item) getKey, Iterable<V> items) => items
    .toListOrThis()
    .asMap()
    .map((_, value) => MapEntry(getKey(value), value));
