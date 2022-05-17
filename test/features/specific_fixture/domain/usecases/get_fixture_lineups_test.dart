import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/data/models/lineup_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineup.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixtureLineupsRepository extends Mock implements FixtureRepository<List<Lineup>> {}

void main() {
  late GetFixtureLineups usecase;
  late MockFixtureLineupsRepository mockFixtureLineupsRepository;

  setUp(() {
    mockFixtureLineupsRepository = MockFixtureLineupsRepository();
    usecase = GetFixtureLineups(mockFixtureLineupsRepository);
  });

  const int tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_lineups.json'));
  final List<dynamic> response = decoded['response'];
  final List<LineupModel> tLineupModelsList = response
      .map(
        (e) => LineupModel.fromJson(e),
      )
      .toList();
  final List<Lineup> tLineupList = tLineupModelsList
      .map(
        (e) => e.toDomain(),
      )
      .toList();
  test('should get live matches from the repository', () async {
    //arrange
    when(() => mockFixtureLineupsRepository.getFixtureComponent(any()))
        .thenAnswer((_) async => Right(tLineupList));
    //act
    final result = await usecase(const LineupsParams(fixtureId: tFixtureId));
    //assert
    expect(result, Right(tLineupList));
    verify(() => mockFixtureLineupsRepository.getFixtureComponent(tFixtureId));
    verifyNoMoreInteractions(mockFixtureLineupsRepository);
  });
}
