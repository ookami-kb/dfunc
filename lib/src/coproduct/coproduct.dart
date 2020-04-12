abstract class Coproduct0 {
  const Coproduct0();
}

abstract class Coproduct1<T1> {
  const Coproduct1();

  R match<R>(R Function(T1) ifFirst);
}

abstract class Coproduct2<T1, T2> {
  const Coproduct2();

  R match<R>(R Function(T1) ifFirst, R Function(T2) ifSecond);
}

abstract class Coproduct3<T1, T2, T3> {
  const Coproduct3();

  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
  );
}

abstract class Coproduct4<T1, T2, T3, T4> {
  const Coproduct4();

  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
  );
}

abstract class Coproduct5<T1, T2, T3, T4, T5> {
  const Coproduct5();

  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
    R Function(T5) ifFifth,
  );
}
