import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/lineup_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_lineups_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineup.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock
    implements FixtureLineupsRemoteDataSource {}

// class MockLocalDataSource extends Mock implements LiveMatchesLocalDataSource {

// }

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late FixtureLineupsRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  //late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    //mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = FixtureLineupsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      //localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getConcreteFixtureLineups', () {
    const tFixtureId = 1;
    final decoded = jsonDecode(fixture('fixture_lineups.json'));
    final List<dynamic> response = decoded['response'];
    final List<LineupModel> tLineupModelsList = response.map((e) => LineupModel.fromJson(e),).toList();
    final List<Lineup> tLineupList = tLineupModelsList.map((e) => e.toDomain(),).toList();
    test('check if the device is online', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getFixtureLineups(any()),).thenAnswer((_) async => tLineupModelsList);
      //act
      repository.getFixtureComponent(tFixtureId);
      //assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        //arrange
        when(() => mockRemoteDataSource.getFixtureLineups(any()))
            .thenAnswer((_) async => tLineupModelsList);
        //act
        final result = await repository.getFixtureComponent(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
        bool isEqual = listEquals(result.fold((l) => null, (r) => r), tLineupList);
        expect(isEqual, equals(true));
      });

      //       test('should cache the data locally when the call to remote data source is successful', () async {
      //   //arrange
      //   when(() => mockRemoteDataSource.getFixtureLineups(any())).thenAnswer((_) async => tFixtureLineupsModel);
      //   //act
      //   await repository.getFixtureLineups(tFixtureId);
      //   //assert
      //   verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
      //   verify(() => mockLocalDataSource.cacheLiveMatches(tFixtureLineupsModel),);
      // });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(() => mockRemoteDataSource.getFixtureLineups(any()))
            .thenThrow(ServerException());
        //act
        final result = await repository.getFixtureComponent(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
        //verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    //     group('device is offline', () {
    //   setUp(() {
    //     when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    //   });
    //   test('should return last locally cached data when the cached data is present', () async {
    //     //arrange
    //     when(() => mockLocalDataSource.getLastFixtureLineups()).thenAnswer((_) async => tFixtureLineupsModel);
    //     //act
    //     final result = await repository.getFixtureLineups(tFixtureId);
    //     //assert
    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(() => mockLocalDataSource.getLastFixtureLineups());
    //     expect(result, equals(const Right(tFixtureLineupsModel)));
    //   });

    //   test('should return CacheFailure when there is no cached data present', () async {
    //     //arrange
    //     when(() => mockLocalDataSource.getLastFixtureLineups()).thenThrow(CacheException());
    //     //act
    //     final result = await repository.getFixtureLineups(tFixtureId);
    //     //assert
    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(() => mockLocalDataSource.getLastFixtureLineups());
    //     expect(result, equals(Left(CacheFailure())));
    //   });
    // });
  });
}
