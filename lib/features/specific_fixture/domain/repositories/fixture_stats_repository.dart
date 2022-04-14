import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';

import '../entities/stats.dart';

abstract class FixtureStatsRepository {
  Future<Either<Failure, Stats>> getFixtureStats(int id);
}