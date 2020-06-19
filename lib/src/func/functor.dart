abstract class Functor<F, A> {
  Functor<F, B> map<B>(B Function(A) f);
}
