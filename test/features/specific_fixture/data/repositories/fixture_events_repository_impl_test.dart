import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_events/fixture_events_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/events_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_events_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/events.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:mocktail/mocktail.dart';

class MockFixtureEventsRemoteDataSource extends Mock
    implements FixtureEventsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockFixtureEventsRemoteDataSource mockFixtureEventsRemoteDataSource;
  late FixtureEventsRepositoryImpl repository;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockFixtureEventsRemoteDataSource = MockFixtureEventsRemoteDataSource();
    repository = FixtureEventsRepositoryImpl(
        networkInfo: mockNetworkInfo,
        remoteDataSource: mockFixtureEventsRemoteDataSource);
  });

  const tFixtureId = 1;
  var tFixtureEventsModel = EventsModel(events: [
    Event(
        time: const Time(elapsed: 1),
        team: Team(id: 1, name: 'Arsenal', logo: 'logo'),
        player: const Player(id: 1, name: 'Lukaku', number: 9, pos: 'A', grid: '1:1'),
        assist: const Assist(id: 2, name: 'Mount'),
        type: 'Goal',
        detail: 'Normal Goal', icon: const EventIcon(detail: 'detail', icon: Icon(Icons.event)))
  ]);

  test('check if the device is online', () {
    //arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockFixtureEventsRemoteDataSource.getFixtureEvents(any()),).thenAnswer((_) async => tFixtureEventsModel);
    //act
    repository.getFixtureEvents(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
          //arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockFixtureEventsRemoteDataSource.getFixtureEvents(any()),).thenAnswer((_) async => tFixtureEventsModel);
          //act
          final result = await repository.getFixtureEvents(tFixtureId);
          //assert
          verify(() => mockFixtureEventsRemoteDataSource.getFixtureEvents(tFixtureId),);
          expect(result, equals(Right(tFixtureEventsModel)));
        });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      //arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockFixtureEventsRemoteDataSource.getFixtureEvents(any()),).thenThrow(ServerException());
          //act
          final result = await repository.getFixtureEvents(tFixtureId);
          //assert
          verify(() => mockFixtureEventsRemoteDataSource.getFixtureEvents(tFixtureId),);
          expect(result, equals(Left(ServerFailure())));
    });
  });
}