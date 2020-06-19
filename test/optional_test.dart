import 'package:dfunc/dfunc.dart';
import 'package:test/test.dart';

void main() {
  test('Creates empty Optional', () {
    final optional = Optional.of(null);
    expect(optional.isEmpty(), true);
  });

  test('Creates non-empty Optional', () {
    final optional = Optional.of('test');
    expect(optional.isEmpty(), false);
  });

  test('getOrNull() returns null for empty Optional', () {
    final optional = Optional.of(null);
    expect(optional.getOrNull(), null);
  });

  test('getOrElse() returns callback result for empty Optional', () {
    final optional = Optional<String>.of(null);
    expect(optional.getOrElse(() => 'orElse'), 'orElse');
  });

  test('getOrNull() returns value for non-empty Optional', () {
    final optional = Optional.of('test');
    expect(optional.getOrNull(), 'test');
  });

  test('getOrElse() returns value for non-empty Optional', () {
    final optional = Optional.of('test');
    expect(optional.getOrElse(() => 'orElse'), 'test');
  });

  test('map() works for empty Optional', () {
    final optional = Optional<String>.of(null);
    expect(optional.map(int.parse).isEmpty(), true);
  });

  test('map() works for non-empty Optional', () {
    final optional = Optional<String>.of('123');
    expect(optional.map(int.parse), some(123));
  });

  test('flatMap() works for empty Optional', () {
    final optional = Optional<String>.of(null);
    expect(optional.flatMap((v) => Optional.of(int.parse(v))).isEmpty(), true);
  });

  test('flatMap() works for non-empty Optional', () {
    final optional = Optional<String>.of('123');
    expect(optional.flatMap((v) => Optional.of(int.parse(v))), some(123));
  });

  group('mapAsync()', () {
    final map = (String v) => Future.value(int.parse(v));

    test('works for empty Optional', () async {
      final optional = Optional<String>.of(null);
      final result = await optional.mapAsync(map);
      expect(result.isEmpty(), true);
    });

    test('works for non-empty Optional', () async {
      final optional = Optional<String>.of('123');
      final result = await optional.mapAsync(map);
      expect(result, some(123));
    });
  });

  group('flatMapAsync()', () {
    final map = (String value) => Future.value(Optional.of(int.parse(value)));

    test('works for empty Optional', () async {
      final optional = Optional<String>.of(null);
      final result = await optional.flatMapAsync(map);
      expect(result.isEmpty(), true);
    });

    test('works for non-empty Optional', () async {
      final optional = Optional<String>.of('123');
      final result = await optional.flatMapAsync(map);
      expect(result, some(123));
    });
  });

  group('Future map()', () {
    Future<Optional<String>> create(String value) async => Optional.of(value);

    test('works for empty Optional', () async {
      final optional = await create(null).mapAsync(int.parse);
      expect(optional.isEmpty(), true);
    });

    test('works for non-empty Optional', () async {
      final optional = await create('123').mapAsync(int.parse);
      expect(optional, some(123));
    });
  });

  group('Future flatMap()', () {
    Future<Optional<String>> create(String value) async => Optional.of(value);
    Optional<int> map(String value) => Optional.of(int.parse(value));

    test('works for empty Optional', () async {
      final optional = await create(null).flatMapAsync(map);
      expect(optional.isEmpty(), true);
    });

    test('works for non-empty Optional', () async {
      final optional = await create('123').flatMapAsync(map);
      expect(optional, some(123));
    });
  });

  group('toOptional()', () {
    test('creates empty Optional', () {
      final String value = null;
      expect(value.toOptional().isEmpty(), true);
    });

    test('creates non-empty Optional', () {
      final value = 'test';
      expect(value.toOptional(), some('test'));
    });
  });

  group('where()', () {
    test('returns same optional if value matches predicate', () {
      final value = 'test'.toOptional();
      expect(value.where((v) => v == 'test'), value);
    });

    test('returns empty optional if value does not match predicate', () {
      final value = 'test'.toOptional();
      expect(value.where((v) => v == 'smth').isEmpty(), true);
    });

    test('returns empty optional if initial optional is empty', () {
      final value = Optional.empty();
      expect(value.where((v) => v == 'smth').isEmpty(), true);
    });
  });
}
