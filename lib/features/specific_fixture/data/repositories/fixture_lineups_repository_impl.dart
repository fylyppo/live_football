import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/lineup.dart';
import '../../domain/repositories/fixtures_lineups_repository.dart';
import '../datasources/fixture_lineups/fixture_lineups_remote_data_source.dart';

class FixtureLineupsRepositoryImpl implements FixtureLineupsRepository {
  final FixtureLineupsRemoteDataSource remoteDataSource;
  //final FixtureLineupsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FixtureLineupsRepositoryImpl(
      {required this.remoteDataSource,
      //required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Lineup>>> getFixtureLineups(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureLineups = await remoteDataSource.getFixtureLineups(id);
        //localDataSource.cacheFixtureLineups(remoteFixtureLineups);
        return Right(remoteFixtureLineups.map((e) => e.toDomain()).toList());
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