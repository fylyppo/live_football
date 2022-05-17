import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';

abstract class FixtureRepository<Type> {
  Future<Either<Failure, Type>> getFixtureComponent(int id);
}