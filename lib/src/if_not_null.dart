/// Returns result of calling `apply` function with `arg` argument
/// if `arg != null`, otherwise returns `null`.
S ifNotNull<T, S>(S Function(T) apply, T arg) => _ifNotNull(apply, arg);

extension IfNotNull<T> on T {
  S ifNotNull<S>(S Function(T) apply) => _ifNotNull(apply, this);
}

S _ifNotNull<T, S>(S Function(T) apply, T arg) =>
    arg == null ? null : apply(arg);
