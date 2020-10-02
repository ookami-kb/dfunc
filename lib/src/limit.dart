import 'package:dfunc/dfunc.dart';

/// Returns functions that limits passed string to the `maxLength`
/// number of characters.
///
/// If passed string is shorter than limit, it will return passed string.
/// If passed string is `null`, it will return empty string.
///
/// ```dart
/// final limit3 = limit(3);
/// limit3('Test') // 'Tes'
/// ```
String Function(String?) limit(int maxLength) =>
    (String? s) => substring(s, 0, maxLength);
