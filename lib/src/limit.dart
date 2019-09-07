import 'dart:math';

/// Returns string limited to the `maxLength` number of characters.
///
/// If passed string is shorter than limit, it returns passed string.
/// If passed string is `null`, it returns empty string.
String Function(String) limit(int maxLength) =>
    (String s) => s == null ? '' : s.substring(0, min(maxLength, s.length));
