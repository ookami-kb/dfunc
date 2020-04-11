abstract class Coproduct0 {}

abstract class Coproduct1<T1> {
  R match<R>(R Function(T1) ifFirst);
}

abstract class Coproduct2<T1, T2> {
  R match<R>(R Function(T1) ifFirst, R Function(T2) ifSecond);
}

abstract class Coproduct3<T1, T2, T3> {
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
  );
}

abstract class Coproduct4<T1, T2, T3, T4> {
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
  );
}

abstract class Coproduct5<T1, T2, T3, T4, T5> {
  R match<R>(
    R Function(T1) ifFirst,
    R Function(T2) ifSecond,
    R Function(T3) ifThird,
    R Function(T4) ifFourth,
    R Function(T5) ifFifth,
  );
}
