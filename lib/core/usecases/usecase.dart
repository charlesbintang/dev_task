class NoParams {}

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
