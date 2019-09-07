import 'package:dfunc/dfunc.dart';

/// Returns string limited to the `maxLength` number of characters.
///
/// If passed string is shorter than limit, it returns passed string.
/// If passed string is `null`, it returns empty string.
String Function(String) limit(int maxLength) =>
    (String s) => substring(s, 0, maxLength);
