import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/repositories/fixture_repository.dart';
import '../datasources/impl/fixture/fixture_local_data_source.dart';
import '../datasources/impl/fixture/fixture_remote_data_source.dart';

class FixtureRepositoryImpl implements FixtureRepository<Fixture> {
  final FixtureRemoteDataSource remoteDataSource;
  final FixtureLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FixtureRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Fixture>> getFixtureComponent(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFixtureModel = await remoteDataSource.getFixture(id);
        localDataSource.cacheFixture(remoteFixtureModel);
        return Right(remoteFixtureModel.toDomain());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final localFixtureModel = await localDataSource.getLastFixture();
      return Right(localFixtureModel.toDomain());
      } on CacheException {
        return Left(CacheFailure());
      }
      
    }
  }
}
