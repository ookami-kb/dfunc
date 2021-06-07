extension StringExt on String {
  /// Returns result of [f] if [this] is empty, else returns [this].
  String ifEmpty(String Function() f) => isEmpty ? f() : this;
}

extension NullableStringExt on String? {
  /// Returns empty string if [this] is null, else returns [this].
  String orEmpty() => this ?? '';
}
