import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/domain/entities/events.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_events_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:mocktail/mocktail.dart';

class MockFixtureEventsRepository extends Mock implements FixtureEventsRepository {}

void main() {
  late FixtureEventsRepository mockFixtureEventsRepository;
  late GetFixtureEvents usecase;

  setUp(() {
    mockFixtureEventsRepository = MockFixtureEventsRepository();
    usecase = GetFixtureEvents(mockFixtureEventsRepository);
  });

  const tFixtureId = 1;
  var tFixtureEvents = Events(events: [
    Event(
        time: const Time(elapsed: 1),
        team: Team(id: 1, name: 'Arsenal', logo: 'logo'),
        player: const Player(id: 1, name: 'Lukaku', number: 9, pos: 'A', grid: '1:1'),
        assist: const Assist(id: 2, name: 'Mount'),
        type: 'Goal',
        detail: 'Normal Goal', icon: const EventIcon(detail: 'detail', icon: Icon(Icons.event)))
  ]);

  test('should get fixture events from the repository', () async {
    //arrange
    when(() => mockFixtureEventsRepository.getFixtureEvents(any())).thenAnswer((_) async => Right(tFixtureEvents));
    //act
    final result = await usecase(const FixtureParams(id: tFixtureId));
    //assert
    expect(result, Right(tFixtureEvents));
    verify(() => mockFixtureEventsRepository.getFixtureEvents(tFixtureId));
    verifyNoMoreInteractions(mockFixtureEventsRepository);
  });
}
