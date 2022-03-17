import 'package:live_football/core/platform/network_info.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';

import '../datasources/live_matches_local_data_source.dart';
import '../datasources/live_matches_remote_data_source.dart';

class LiveMatchesRepositoryImpl implements LiveMatchesRepository {
  final LiveMatchesRemoteDataSource remoteDataSource;
  final LiveMatchesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LiveMatchesRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});
  
  @override
  Future<Either<Failure, LiveMatches>> getLiveMatches(String? league) {
    throw UnimplementedError();
  }
  
}