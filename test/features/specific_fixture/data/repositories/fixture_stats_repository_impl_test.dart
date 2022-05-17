import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_component_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_stats_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixtureStatsRemoteDataSource extends Mock implements FixtureComponentRemoteDataSource<List<StatsModel>> {}

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
  final List<dynamic> response = decoded['response'];
  final List<StatsModel> tStatsModelsList = response.map((e) => StatsModel.fromJson(e),).toList();
  final List<Stats> tStatsList = tStatsModelsList.map((e) => e.toDomain(),).toList();
  test('should check if the device is online', () {
    //arrange
    when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
    when(() => mockFixtureStatsRemoteDataSource.getFixtureComponent(tFixtureId),).thenAnswer((_) async => tStatsModelsList);
    //act
    repository.getFixtureComponent(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    test('should return remote data when when the call to remote data is successful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockFixtureStatsRemoteDataSource.getFixtureComponent(any()),).thenAnswer((_) async => tStatsModelsList);
      //act
      final result = await repository.getFixtureComponent(tFixtureId);
      //assert
      verify(() => mockFixtureStatsRemoteDataSource.getFixtureComponent(tFixtureId));
      bool isEqual = listEquals(result.fold((l) => null, (r) => r), tStatsList);
      expect(isEqual, equals(true));
    });

    test('should return server failure when the call to remote data is unsuccessful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
      when(() => mockFixtureStatsRemoteDataSource.getFixtureComponent(any()),).thenThrow(ServerException());
      //act
      final result = await repository.getFixtureComponent(tFixtureId);
      //assert
      verify(() => mockFixtureStatsRemoteDataSource.getFixtureComponent(tFixtureId));
      expect(result, Left(ServerFailure()));
    });
  });
}