import 'package:dfunc/src/either/either.dart';
import 'package:dfunc/src/product/product.dart';

abstract class Eithers {
  Eithers._();

  static Either<L, Product2<R1, R2>> combine2<L, R1, R2>(
    Either<L, R1> first,
    Either<L, R2> second,
  ) =>
      first.combine(second);

  static Either<L, Product3<R1, R2, R3>> combine3<L, R1, R2, R3>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
  ) =>
      first
          .combine(second)
          .combine(third)
          .map((p) => Product3(p.item1.item1, p.item1.item2, p.item2));

  static Either<L, Product4<R1, R2, R3, R4>> combine4<L, R1, R2, R3, R4>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
    Either<L, R4> fourth,
  ) =>
      combine3(first, second, third).combine(fourth).map(
            (p) => Product4(
              p.item1.item1,
              p.item1.item2,
              p.item1.item3,
              p.item2,
            ),
          );

  static Either<L, Product5<R1, R2, R3, R4, R5>>
      combine5<L, R1, R2, R3, R4, R5>(
    Either<L, R1> first,
    Either<L, R2> second,
    Either<L, R3> third,
    Either<L, R4> fourth,
    Either<L, R5> fifth,
  ) =>
          combine4(first, second, third, fourth).combine(fifth).map(
                (p) => Product5(
                  p.item1.item1,
                  p.item1.item2,
                  p.item1.item3,
                  p.item1.item4,
                  p.item2,
                ),
              );
}
