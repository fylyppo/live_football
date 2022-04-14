import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';

abstract class GetFixturesUseCase<Type, FixturesParams> {
  Future<Either<Failure, Type>> call(FixturesParams params);
}