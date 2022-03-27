import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class FixtureUseCase<Type, FixtureParams> {
  Future<Either<Failure, Type?>?> call(FixtureParams params);
}