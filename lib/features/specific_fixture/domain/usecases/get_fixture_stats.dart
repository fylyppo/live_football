import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_stats_repository.dart';
import '../../../../core/usecases/usecase.dart';
import 'get_fixture.dart';

class GetFixtureStats implements UseCase<List<Stats>, FixtureParams>{
  final FixtureStatsRepository repository;

  GetFixtureStats(this.repository);

  @override
  Future<Either<Failure, List<Stats>>> call(FixtureParams params) async {
    return await repository.getFixtureStats(params.id);
  }
}