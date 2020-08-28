extension Let<T> on T {
  /// Calls the specified function [block] with [this] value as its argument
  /// and returns its result.
  R let<R>(R Function(T) block) => block(this);
}

extension Also<T> on T {
  /// Calls the specified function [block] with [this] value as its argument
  /// and returns [this] value.
  T also(void Function(T) block) {
    block(this);
    return this;
  }
}
