/// Creates map from [items] list. Keys of the map are created by
/// applying [getKey] function to the corresponding item of the list.
Map<K, V> mapBy<K, V>(K Function(V item) getKey, List<V> items) =>
    items.asMap().map((_, value) => MapEntry(getKey(value), value));
