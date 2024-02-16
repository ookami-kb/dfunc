import 'package:dfunc/src/either/either.dart';

abstract class Eithers {
  const Eithers._();

  static Either<L, (R1, R2)> combine2<L, R1, R2>(
    Either<L, R1> first,
    Either<L, R2> second,
  ) =>
      first.combine(second);

  static Either<L, (R1, R2, R3)> combine3<L, R1, R2, R3>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
  ) =>
      first.combine(second).combine(third).map((p) => (p.$1.$1, p.$1.$2, p.$2));

  static Either<L, (R1, R2, R3, R4)> combine4<L, R1, R2, R3, R4>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
    Either<L, R4> fourth,
  ) =>
      combine3(first, second, third).combine(fourth).map(
            (p) => (
              p.$1.$1,
              p.$1.$2,
              p.$1.$3,
              p.$2,
            ),
          );

  static Either<L, (R1, R2, R3, R4, R5)> combine5<L, R1, R2, R3, R4, R5>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
    Either<L, R4> fourth,
    Either<L, R5> fifth,
  ) =>
      combine4(first, second, third, fourth).combine(fifth).map(
            (p) => (
              p.$1.$1,
              p.$1.$2,
              p.$1.$3,
              p.$1.$4,
              p.$2,
            ),
          );
}
