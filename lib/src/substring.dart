import 'dart:math';

/// Safely returns the substring of this string that extends from [startIndex],
/// inclusive, to [endIndex], exclusive.
///
/// If [startIndex] or [endIndex] are greater than [str] length, function
/// will keep them within the bounds.
/// If passed string is `null`, it returns empty string.
///
/// ```dart
/// var string = 'dartlang';
/// string.substring(1, 4); // 'art'
/// string.substring(1, 40); // 'artlang'
/// ```
String substring(String? str, int startIndex, [int? endIndex]) =>
    (str == null || str.isEmpty)
        ? ''
        : str.substring(
            min(startIndex, str.length - 1),
            min(endIndex ?? str.length, str.length),
          );
