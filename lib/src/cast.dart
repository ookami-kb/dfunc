/// Safely casts [t] to type [T].
///
/// Returns null if [t] is not of type [T].
T? castOrNull<T>(dynamic t) => t is T ? t : null;

/// Safely casts [t] to type [T].
///
/// Returns result of [orElse] call if [t] is not of type [T].
T castOrElse<T>(dynamic t, T Function() orElse) => t is T ? t : orElse();
