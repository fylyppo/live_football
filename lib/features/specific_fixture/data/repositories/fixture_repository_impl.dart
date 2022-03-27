import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/repositories/fixture_repository.dart';
import '../datasources/fixture/fixture_local_data_source.dart';
import '../datasources/fixture/fixture_remote_data_source.dart';

class FixtureRepositoryImpl implements FixtureRepository {
  final FixtureRemoteDataSource remoteDataSource;
  final FixtureLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FixtureRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Fixture?>> getFixture(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLiveMatches = await remoteDataSource.getFixture(id);
        localDataSource.cacheFixture(remoteLiveMatches);
        return Right(remoteLiveMatches);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localMatch = await localDataSource.getLastFixture();
      return Right(localMatch);
      } on CacheException {
        return Left(CacheFailure());
      }
      
    }
  }
}
