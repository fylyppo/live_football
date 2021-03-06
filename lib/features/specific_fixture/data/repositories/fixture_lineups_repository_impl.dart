import 'package:dartz/dartz.dart';
import 'package:live_football/features/specific_fixture/data/models/lineup_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/lineup.dart';
import '../../domain/repositories/fixture_repository.dart';
import '../datasources/fixture_component_remote_data_source.dart';

class FixtureLineupsRepositoryImpl implements FixtureRepository {
  final FixtureComponentRemoteDataSource<List<LineupModel>> remoteDataSource;
  //final FixtureLineupsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FixtureLineupsRepositoryImpl(
      {required this.remoteDataSource,
      //required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Lineup>>> getFixtureComponent(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureLineups = await remoteDataSource.getFixtureComponent(id);
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