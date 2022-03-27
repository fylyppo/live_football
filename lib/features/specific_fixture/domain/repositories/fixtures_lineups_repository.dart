import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import '../entities/lineups.dart';

abstract class FixtureLineupsRepository {
  Future<Either<Failure, Lineups?>> getFixtureLineups(int id);
}