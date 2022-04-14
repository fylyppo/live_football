import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/fixtures/domain/repositories/fixtures_repository.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';
import '../datasources/fixtures/fixtures_remote_data_source.dart';

class FixturesRepositoryImpl implements FixturesRepository {
  final NetworkInfo networkInfo;
  final FixturesRemoteDataSource remoteDataSource;

  FixturesRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Fixture>>> getFixtures(
      {String? live,
      String? date,
      int? league,
      int? season,
      int? team,
      int? last,
      int? next,
      String? from,
      String? to,
      String? round,
      String? status}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtures = await remoteDataSource.getFixtures(
            live: live,
            date: date,
            league: league,
            season: season,
            team: team,
            last: last,
            next: next,
            from: from,
            to: to,
            round: round,
            status: status);
        return Right(remoteFixtures.map((e) => e.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
