import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/data/models/event_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/event.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixtureEventsRepository extends Mock implements FixtureRepository<List<Event>> {}

void main() {
  late GetFixtureEvents usecase;
  late MockFixtureEventsRepository mockFixtureEventsRepository;
  
  setUp(() {
    mockFixtureEventsRepository = MockFixtureEventsRepository();
    usecase = GetFixtureEvents(mockFixtureEventsRepository);
  });

  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_events.json'));
  final List<dynamic> response = decoded['response'];
  final List<EventModel> tEventModelsList = response.map((e) => EventModel.fromJson(e),).toList();
  final List<Event> tEventsList = tEventModelsList.map((e) => e.toDomainWithIcon(),).toList();
  test('should get fixture events from the repository', () async {
    //arrange
    when(() => mockFixtureEventsRepository.getFixtureComponent(any())).thenAnswer((_) async => Right(tEventsList));
    //act
    final result = await usecase(const FixtureParams(id: tFixtureId));
    //assert
    expect(result, Right(tEventsList));
    verify(() => mockFixtureEventsRepository.getFixtureComponent(tFixtureId));
    verifyNoMoreInteractions(mockFixtureEventsRepository);
  });
}
