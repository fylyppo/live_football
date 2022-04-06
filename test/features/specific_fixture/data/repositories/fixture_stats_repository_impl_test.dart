import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_stats/fixture_stats_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_stats_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockFixtureStatsRemoteDataSource extends Mock implements FixtureStatsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late FixtureStatsRepositoryImpl repository;
  late MockFixtureStatsRemoteDataSource mockFixtureStatsRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockFixtureStatsRemoteDataSource = MockFixtureStatsRemoteDataSource();
    repository = FixtureStatsRepositoryImpl(networkInfo: mockNetworkInfo, remoteDataSource: mockFixtureStatsRemoteDataSource);
  });

  const tFixtureId = 1;
  var decoded = jsonDecode(fixture('fixture_stats.json'));
  var map = decoded['response'];
  final tStatsModel = StatsModel.fromJson(map);

  test('should check if the device is online', () {
    //arrange
    when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
    when(() => mockFixtureStatsRemoteDataSource.getFixtureStats(tFixtureId),).thenAnswer((_) async => tStatsModel);
    //act
    repository.getFixtureStats(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    test('should return remote data when when the call to remote data is successful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockFixtureStatsRemoteDataSource.getFixtureStats(any()),).thenAnswer((_) async => tStatsModel);
      //act
      final result = await repository.getFixtureStats(tFixtureId);
      //assert
      verify(() => mockFixtureStatsRemoteDataSource.getFixtureStats(tFixtureId));
      expect(result, equals(Right(tStatsModel)));
    });

    test('should return server failure when the call to remote data is unsuccessful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
      when(() => mockFixtureStatsRemoteDataSource.getFixtureStats(any()),).thenThrow(ServerException());
      //act
      final result = await repository.getFixtureStats(tFixtureId);
      //assert
      verify(() => mockFixtureStatsRemoteDataSource.getFixtureStats(tFixtureId));
      expect(result, Left(ServerFailure()));
    });
  });
}