import 'package:dfunc/dfunc.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('castOrNull', () {
    test('successful casting returns required type', () {
      const dynamic x = '123';

      expect(castOrNull<String>(x), '123');
    });

    test('unsuccessful casting returns null', () {
      const dynamic x = '123';

      expect(castOrNull<int>(x), null);
    });
  });

  group('castOrElse', () {
    test('successful casting returns required type', () {
      const dynamic x = '123';

      expect(castOrElse<String>(x, () => ''), '123');
    });

    test('unsuccessful casting returns fallback', () {
      const dynamic x = '123';

      expect(castOrElse<int>(x, () => 0), 0);
    });
  });
}
