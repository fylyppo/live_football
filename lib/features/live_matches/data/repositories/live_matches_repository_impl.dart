import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/live_matches/live_matches_local_data_source.dart';
import '../datasources/live_matches/live_matches_remote_data_source.dart';

class LiveMatchesRepositoryImpl implements LiveMatchesRepository {
  final LiveMatchesRemoteDataSource remoteDataSource;
  final LiveMatchesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LiveMatchesRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, LiveMatches?>> getLiveMatches(String? league) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLiveMatches = await remoteDataSource.getLiveMatches(league);
        localDataSource.cacheLiveMatches(remoteLiveMatches);
        return Right(remoteLiveMatches);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localMatch = await localDataSource.getLastLiveMatches();
      return Right(localMatch);
      } on CacheException {
        return Left(CacheFailure());
      }
      
    }
  }
}
