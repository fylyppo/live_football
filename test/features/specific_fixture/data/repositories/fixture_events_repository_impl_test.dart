import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_component_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/event_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_events_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/event.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixtureEventsRemoteDataSource extends Mock implements FixtureComponentRemoteDataSource<List<EventModel>> {}

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
  final decoded = jsonDecode(fixture('fixture_events.json'));
  final List<dynamic> response = decoded['response'];
  final List<EventModel> tEventModelsList = response.map((e) => EventModel.fromJson(e),).toList();
  final List<Event> tEventsList = tEventModelsList.map((e) => e.toDomainWithIcon(),).toList();
  test('check if the device is online', () {
    //arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(() => mockFixtureEventsRemoteDataSource.getFixtureComponent(any()),).thenAnswer((_) async => tEventModelsList);
    //act
    repository.getFixtureComponent(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
          //arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockFixtureEventsRemoteDataSource.getFixtureComponent(any()),).thenAnswer((_) async => tEventModelsList);
          //act
          final result = await repository.getFixtureComponent(tFixtureId);
          //assert
          verify(() => mockFixtureEventsRemoteDataSource.getFixtureComponent(tFixtureId),);
          final foldedList = result.fold((l) => null, (r) => r);
          bool isEqual = foldedList!.length == tEventsList.length;
          expect(isEqual, equals(true));
        });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      //arrange
          when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(() => mockFixtureEventsRemoteDataSource.getFixtureComponent(any()),).thenThrow(ServerException());
          //act
          final result = await repository.getFixtureComponent(tFixtureId);
          //assert
          verify(() => mockFixtureEventsRemoteDataSource.getFixtureComponent(tFixtureId),);
          expect(result, equals(Left(ServerFailure())));
    });
  });
}