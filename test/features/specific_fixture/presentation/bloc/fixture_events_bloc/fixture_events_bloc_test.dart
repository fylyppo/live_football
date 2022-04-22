import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/features/specific_fixture/data/models/event_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/event.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_events_bloc/fixture_events_bloc.dart';
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
    expect(bloc.state, equals(EventsEmpty()));
  });

  group('GetFixtureEvents', () {
  final decoded = jsonDecode(fixture('fixture_events.json'));
  final List<dynamic> response = decoded['response'];
  final List<EventModel> tEventModelsList = response.map((e) => EventModel.fromJson(e),).toList();
  final List<Event> tEventsList = tEventModelsList.map((e) => e.toDomain(),).toList();

    const tFixtureId = 1;
    test('should get data from the concrete usecase', () async {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Right(tEventsList));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
      await untilCalled(() => mockGetFixtureEvents(any()),);
      //assert
      verify(() => mockGetFixtureEvents(const FixtureParams(id: tFixtureId)),);
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () {
      //arrange
      when(() => mockGetFixtureEvents(any())).thenAnswer((_) async => Right(tEventsList));
      //assert later
      final expected = [
        EventsLoading(),
        EventsLoaded(events: tEventsList)
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
        EventsLoading(),
        const EventsError(message: SERVER_FAILURE_MESSAGE)
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
        EventsLoading(),
        const EventsError(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureEventsForId(tFixtureId));
    });
  });
}