import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dfunc/dfunc.dart';
import 'package:source_gen/source_gen.dart';

class SealedGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    final elements = library.annotatedWith(TypeChecker.fromRuntime(Sealed));
    if (!elements.every((e) => e.element is ClassElement)) {
      throw ArgumentError();
    }

    final classElements = elements.map((e) => e.element as ClassElement);

    final List<String> result = [];

    for (final base in classElements) {
      final cases = library.allElements
          .where((e) =>
              e is ClassElement &&
              e.allSupertypes.any((s) => s.element == base))
          .map((e) => e as ClassElement)
          .toList();
      result.add(_generate(base, cases));
    }

    return result.join('\n');
  }

  String _generate(ClassElement base, List<ClassElement> elements) {
    final arity = elements.length;
    if (arity > 10) {
      throw ArgumentError(
          'Sealed classes with arity > 10 are not currently supported.');
    }
    final generics = elements.map((e) => e.name).join(', ');

    final arguments = mapIndexed(
      (int i, ClassElement el) => 'R Function(${el.name}) if${el.name}',
      elements,
    ).join(', ');

    final branches = mapIndexed(
      (int i, ClassElement el) =>
          'if (this is ${el.name}) return if${el.name}(this as ${el.name});',
      elements,
    ).join('\n');

    if (arity == 0) {
      return '''mixin _\$${base.name} implements Coproduct0 {}''';
    }

    return '''
mixin _\$${base.name} implements Coproduct$arity<$generics> {
    @override
    R match<R>($arguments,) {
      $branches
      throw StateError('Invalid argument type: \$runtimeType');
    }
} 
    ''';
  }
}
