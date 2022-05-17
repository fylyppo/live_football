import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import '../../domain/repositories/fixture_repository.dart';
import '../datasources/fixture_component_remote_data_source.dart';

class FixtureStatsRepositoryImpl implements FixtureRepository {
  final NetworkInfo networkInfo;
  final FixtureComponentRemoteDataSource<List<StatsModel>> remoteDataSource;
  
  FixtureStatsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  
  @override
  Future<Either<Failure, List<Stats>>> getFixtureComponent(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureStats = await remoteDataSource.getFixtureComponent(id);
        return Right(remoteFixtureStats.map((e) => e.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

}
