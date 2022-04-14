import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:live_football/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixturesRepository extends Mock implements FixturesRepository {}

void main() {
  late MockFixturesRepository mockFixturesRepository;
  late GetFixtures usecase;

  setUp(() {
    mockFixturesRepository = MockFixturesRepository();
    usecase = GetFixtures(mockFixturesRepository);
  });

  const tFixturesLeagueId = 1;
  final decoded = jsonDecode(fixture('fixtures.json'));
  final List<dynamic> response = decoded['response'];
  final List<Fixture> tFixturesList = response.map((e) => FixtureModel.fromJson(e).toDomain()).toList();
  test('should get fixtures from the repository', () async {
    //arrange
    when(() => mockFixturesRepository.getFixtures(league: any(named: 'league')),).thenAnswer((_) async => Right(tFixturesList));
    //act
    final result = await usecase(const FixturesParams(league: tFixturesLeagueId));
    //assert
    expect(result, equals(Right(tFixturesList)));
    verify(() => mockFixturesRepository.getFixtures(league: tFixturesLeagueId),);
    verifyNoMoreInteractions(mockFixturesRepository);
  });
}