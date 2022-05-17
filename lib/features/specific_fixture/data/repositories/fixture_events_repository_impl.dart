import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/specific_fixture/data/models/event_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/event.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/fixture_repository.dart';
import '../datasources/fixture_component_remote_data_source.dart';

class FixtureEventsRepositoryImpl implements FixtureRepository {
  final NetworkInfo networkInfo;
  final FixtureComponentRemoteDataSource<List<EventModel>> remoteDataSource;

  FixtureEventsRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Event>>> getFixtureComponent(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureEvents = await remoteDataSource.getFixtureComponent(id);
        return Right(remoteFixtureEvents.map((e) => e.toDomainWithIcon()).toList());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
