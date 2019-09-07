Map<K, V> mapBy<K, V>(K Function(V item) getKey, List<V> items) =>
    items.asMap().map((_, value) => MapEntry(getKey(value), value));
