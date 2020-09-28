import 'dart:async';

import 'package:dfunc/src/optional/optional.dart';

typedef BindOptional = T Function<T>(Optional<T>);

Optional<T> optionalFx<T>(T Function(BindOptional bind) run) {
  try {
    return Optional.some(run(_bind));
  } on _BindOptionalException {
    return Optional.empty();
  }
}

Future<Optional<T>> optionalFxAsync<T>(FutureOr<T> Function(BindOptional bind) run) async {
  try {
    return Optional.some(await run(_bind));
  } on _BindOptionalException {
    return Optional.empty();
  }
}

T _bind<T>(Optional<T> value) => value.getOrElse(() => throw _BindOptionalException());

class _BindOptionalException implements Exception {}
