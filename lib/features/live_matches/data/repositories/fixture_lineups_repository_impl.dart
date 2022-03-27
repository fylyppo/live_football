import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/live_matches/domain/entities/lineups.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/fixtures_lineups_repository.dart';
import '../datasources/fixtures_lineups/fixture_lineups_remote_data_source.dart';

class FixtureLineupsRepositoryImpl implements FixtureLineupsRepository {
  final FixtureLineupsRemoteDataSource remoteDataSource;
  //final FixtureLineupsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FixtureLineupsRepositoryImpl(
      {required this.remoteDataSource,
      //required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Lineups?>> getFixtureLineups(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureLineups = await remoteDataSource.getFixtureLineups(id);
        //localDataSource.cacheFixtureLineups(remoteFixtureLineups);
        return Right(remoteFixtureLineups);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      // try{
      //   final localMatch = await localDataSource.getLastLiveMatches();
      // return Right(localMatch);
      // } on CacheException {
      //   return Left(CacheFailure());
      // }
      return Left(CacheFailure());
    }
  }
}