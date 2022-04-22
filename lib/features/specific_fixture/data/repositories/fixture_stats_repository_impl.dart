import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/exceptions.dart';

import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_stats_repository.dart';

import '../datasources/fixture_stats/fixture_stats_remote_data_source.dart';

class FixtureStatsRepositoryImpl implements FixtureStatsRepository {
  final NetworkInfo networkInfo;
  final FixtureStatsRemoteDataSource remoteDataSource;
  
  FixtureStatsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  
  @override
  Future<Either<Failure, List<Stats>>> getFixtureStats(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureStats = await remoteDataSource.getFixtureStats(id);
        return Right(remoteFixtureStats.map((e) => e.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

}
