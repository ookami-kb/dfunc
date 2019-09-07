/// Takes a function `f` and returns a function `g` such that if called with
/// the same argument when `f` returns `true`, g returns `false` and when
/// `f` returns a `false` `g` returns `true`.
bool Function(T) complement<T>(bool Function(T) f) => (T arg) => !f(arg);
