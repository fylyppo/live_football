import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/features/specific_fixture/domain/entities/events.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:live_football/features/specific_fixture/presentation/bloc/fixture_events_bloc/fixture_events_bloc.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockGetFixtureEvents extends Mock implements GetFixtureEvents {}

void main() {
  late FixtureEventsBloc bloc;
  late MockGetFixtureEvents mockGetFixtureEvents;
  
  
  setUp(() {
    registerFallbackValue(const FixtureParams(id: 0));
    mockGetFixtureEvents = MockGetFixtureEvents();
    bloc = FixtureEventsBloc(getFixtureEvents: mockGetFixtureEvents);
  });

  test('initial state should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('GetFixtureEvents', () {
    final Map<String, dynamic> decoded = jsonDecode(fixture('fixture_events.json'));
    final List<dynamic >map = decoded['response'];
    final tFixtureEvents = Events.fromJson(map);

    const tFixtureId = 1;
    test('should get data from the concrete usecase', () async {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Right(tFixtureEvents));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
      await untilCalled(() => mockGetFixtureEvents(any()),);
      //assert
      verify(() => mockGetFixtureEvents(const FixtureParams(id: tFixtureId)),);
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Right(tFixtureEvents));
      //assert later
      final expected = [
        Loading(),
        Loaded(events: tFixtureEvents)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
    });

    test('should emit [Loading, Error] when data fails', () {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
    });

    test('should emit [Loading, Error] with a proper message for the error when getting data fails', () {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
    });
  });
}