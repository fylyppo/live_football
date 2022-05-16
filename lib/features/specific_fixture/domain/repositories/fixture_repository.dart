import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';

abstract class FixtureRepository {
  Future<Either<Failure, Fixture>> getFixture(int id);
}