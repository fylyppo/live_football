import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/specific_fixture/domain/entities/event.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/fixture_events_repository.dart';
import '../datasources/fixture_events/fixture_events_remote_data_source.dart';

class FixtureEventsRepositoryImpl implements FixtureEventsRepository {
  final NetworkInfo networkInfo;
  final FixtureEventsRemoteDataSource remoteDataSource;

  FixtureEventsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Event>>> getFixtureEvents(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureEvents = await remoteDataSource.getFixtureEvents(id);
        return Right(remoteFixtureEvents.map((e) => e.toDomain()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
