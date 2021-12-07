import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart' hide Func1;

void main() {
  group('lift', () {
    final tryParse = lift(int.tryParse);

    test('lifted tryParse parses non-null valid', () {
      expect(tryParse('123'), 123);
    });

    test('lifted tryParse parses non-null invalid', () {
      expect(tryParse('abc'), null);
    });

    test('lifted tryParse parses null', () {
      expect(tryParse(null), null);
    });
  });

  group('catches', () {
    test('returns value', () {
      expect(catches(() => 3), 3);
    });

    test('returns null on exception', () {
      expect(catches(() => throw Exception()), null);
    });
  });

  group('map2', () {
    test('returns value', () {
      expect(map2<int, int, int>(1, 2, (a, b) => a + b), 3);
    });

    test('returns null', () {
      expect(map2<int, int, int>(1, null, (a, b) => a + b), null);
    });
  });

  group('traverse', () {
    test('returns value', () {
      expect(traverse([1, 2, 3], (int a) => a + 1), [2, 3, 4]);
    });

    test('returns null', () {
      expect(traverse([1, null, 3], (int a) => a + 1), null);
    });
  });

  group('sequence', () {
    test('returns value', () {
      expect(sequence([1, 2, 3]), [1, 2, 3]);
    });

    test('returns null', () {
      expect(sequence([1, null, 3]), null);
    });
  });
}
