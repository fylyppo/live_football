import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture/fixture_local_data_source.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture/fixture_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements FixtureRemoteDataSource {}

class MockLocalDataSource extends Mock implements FixtureLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late FixtureRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = FixtureRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  
  group('getConcreteFixture', () {
    const tFixtureId = 850;
    var tFixtureModel = FixtureModel(
          league: League(
              id: 1,
              name: 'Premier League',
              logo: 'logo',
              flag: 'flag',
              round: 'Round 1'),
          teams: Teams(
              home: Team(id: 1, name: 'Arsenal', logo: 'logo'),
              away: Team(id: 2, name: 'Chelsea', logo: 'logo')),
          goals: Goals(home: 1, away: 2),
          fixture: FixtureData(id: 1, date: 'Date', status: Status(elapsed: 1, long: '', short: ''), venue: Venue(id: 1, name: 'name', city: 'city'), referee: '', timestamp: 1));
    
    test('check if the device is online', () async {
    //arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockRemoteDataSource.getFixture(any())).thenAnswer((_) async => tFixtureModel);
    //act
    repository.getFixture(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        //arrange
        when(() => mockRemoteDataSource.getFixture(any())).thenAnswer((_) async => tFixtureModel);
        //act
        final result = await repository.getFixture(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixture(tFixtureId));
        expect(result, equals(Right(tFixtureModel.toDomain())));
      });

            test('should cache the data locally when the call to remote data source is successful', () async {
        //arrange
        when(() => mockRemoteDataSource.getFixture(any())).thenAnswer((_) async => tFixtureModel);
        //act
        await repository.getFixture(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixture(tFixtureId));
        verify(() => mockLocalDataSource.cacheFixture(tFixtureModel),);
      });

            test('should return server failure when the call to remote data source is unsuccessful', () async {
        //arrange
        when(() => mockRemoteDataSource.getFixture(any())).thenThrow(ServerException());
        //act
        final result = await repository.getFixture(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixture(tFixtureId));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

        group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('should return last locally cached data when the cached data is present', () async {
        //arrange
        when(() => mockLocalDataSource.getLastFixture()).thenAnswer((_) async => tFixtureModel);
        //act
        final result = await repository.getFixture(tFixtureId);
        //assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastFixture());
        expect(result, equals(Right(tFixtureModel.toDomain())));
      });

      test('should return CacheFailure when there is no cached data present', () async {
        //arrange
        when(() => mockLocalDataSource.getLastFixture()).thenThrow(CacheException());
        //act
        final result = await repository.getFixture(tFixtureId);
        //assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getLastFixture());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}