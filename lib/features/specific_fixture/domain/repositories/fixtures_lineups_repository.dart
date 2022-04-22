import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import '../entities/lineup.dart';

abstract class FixtureLineupsRepository {
  Future<Either<Failure, List<Lineup>>> getFixtureLineups(int id);
}