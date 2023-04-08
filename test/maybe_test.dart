// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  group(
    'maybeMap:',
    () {
      test('for null returns null', () {
        const String? x = null;
        expect(x.maybeMap((e) => e.toUpperCase()), null);
      });

      test('for some returns some', () {
        const String? x = 'a';
        expect(x.maybeMap((e) => e.toUpperCase()), 'A');
      });
    },
  );

  group('maybeFlatMap:', () {
    test('for null returning null', () {
      const String? x = null;
      expect(x.maybeFlatMap<String>((_) => null), null);
    });

    test('for null returning some', () {
      const String? x = null;
      expect(x.maybeFlatMap((e) => e.toUpperCase()), null);
    });

    test('for some returning null', () {
      const String? x = 'a';
      expect(x.maybeFlatMap<String>((_) => null), null);
    });

    test('for some returning some', () {
      const String? x = 'a';
      expect(x.maybeFlatMap((e) => e.toUpperCase()), 'A');
    });
  });

  group('maybeWhere:', () {
    test('for some with false predicate', () {
      const String? x = 'a';
      expect(x.maybeWhere((e) => e.isEmpty), null);
    });

    test('for some with true predicate', () {
      const String? x = 'a';
      expect(x.maybeWhere((e) => e.isNotEmpty), 'a');
    });

    test('for non-null with false predicate', () {
      const String x = 'a';
      expect(x.maybeWhere((e) => e.isEmpty), null);
    });

    test('for non-null with true predicate', () {
      const String x = 'a';
      expect(x.maybeWhere((e) => e.isNotEmpty), 'a');
    });
  });

  group('maybeWhereType:', () {
    test('for some with wrong type', () {
      const String? x = 'a';
      expect(x.maybeWhereType<int>(), null);
    });

    test('for some with right type', () {
      const String? x = 'a';
      expect(x.maybeWhereType<String>(), 'a');
    });

    test('for null with wrong type', () {
      const String? x = null;
      expect(x.maybeWhereType<int>(), null);
    });

    test('for null with right type', () {
      const String? x = null;
      expect(x.maybeWhereType<String>(), null);
    });

    test('for non-null with wrong type', () {
      const String x = 'a';
      expect(x.maybeWhereType<int>(), null);
    });

    test('for non-null with right type', () {
      const String x = 'a';
      expect(x.maybeWhereType<String>(), 'a');
    });
  });

  group('ifNull:', () {
    test('calls function for null value', () {
      const String? x = null;
      expect(x.ifNull(() => 'fallback'), 'fallback');
    });

    test('does not call function for non-null value', () {
      const String? x = 'value';
      expect(x.ifNull(() => 'fallback'), 'value');
    });
  });
}
