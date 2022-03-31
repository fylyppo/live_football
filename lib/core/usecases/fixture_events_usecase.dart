import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';

abstract class FixtureEventsUseCase<Type, FixtureParams>{
  Future<Either<Failure, Type>> call(FixtureParams params);
}