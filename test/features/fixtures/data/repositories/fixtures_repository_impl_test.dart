import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/fixtures/data/datasources/fixtures/fixtures_remote_data_source.dart';
import 'package:live_football/features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFixturesRemoteDataSource extends Mock implements FixturesRemoteDataSource {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockFixturesRemoteDataSource mockFixturesRemoteDataSource;
  late FixturesRepositoryImpl repository;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockFixturesRemoteDataSource = MockFixturesRemoteDataSource();
    repository = FixturesRepositoryImpl(networkInfo: mockNetworkInfo, remoteDataSource: mockFixturesRemoteDataSource);
    registerFallbackValue('');
  });

  const tLeagueId = 1;
  final decoded = jsonDecode(fixture('fixtures.json'));
  final List<dynamic> response = decoded['response'];
  final List<FixtureModel> tFixturesModelsList = response.map((e) => FixtureModel.fromJson(e),).toList();
  final List<Fixture> tFixturesList = tFixturesModelsList.map((e) => e.toDomain(),).toList();

  test('check if the device is online', () {
    //arrange
    when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
    when(() => mockFixturesRemoteDataSource.getFixtures(league: any(named: 'league')),).thenAnswer((_) async => tFixturesModelsList);
    //act
    repository.getFixtures(league: tLeagueId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    test('should return remote data when the call to remote data source is successful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
      when(() => mockFixturesRemoteDataSource.getFixtures(league: any(named: 'league')),).thenAnswer((_) async => tFixturesModelsList);
      //act
      final result = await repository.getFixtures(league: tLeagueId);
      //assert
      verify(() => mockFixturesRemoteDataSource.getFixtures(league: tLeagueId),);
      bool isEqual = listEquals(result.fold((l) => null, (r) => r), tFixturesList);
      expect(isEqual, equals(true));
    });

        test('should return server failure when the call to remote data is unsuccessful', () async {
      //arrange
      when(() => mockNetworkInfo.isConnected,).thenAnswer((_) async => true);
      when(() => mockFixturesRemoteDataSource.getFixtures(league: any(named: 'league')),).thenThrow(ServerException());
      //act
      final result = await repository.getFixtures(league: tLeagueId);
      //assert
      verify(() => mockFixturesRemoteDataSource.getFixtures(league: tLeagueId),);
      expect(result, Left(ServerFailure()));
    });
  });
}