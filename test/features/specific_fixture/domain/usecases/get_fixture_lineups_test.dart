import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixtures_lineups_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:mocktail/mocktail.dart';

class MockFixtureLineupsRepository extends Mock
    implements FixtureLineupsRepository {}

void main() {
  late GetFixtureLineups usecase;
  late MockFixtureLineupsRepository mockFixtureLineupsRepository;

  setUp(() {
    mockFixtureLineupsRepository = MockFixtureLineupsRepository();
    usecase = GetFixtureLineups(mockFixtureLineupsRepository);
  });

  const int tFixtureId = 1;
  const tFixtureLineups = Lineups(
      homeLineup: Lineup(
          team: Team(
              id: 50,
              name: 'Manchester City',
              logo: 'https://media.api-sports.io/football/teams/50.png'),
          formation: "4-3-3",
          startXI: Players(playersList: [
            Player(id: 617, name: "Ederson", number: 31, pos: "G", grid: "1:1"),
            Player(
                id: 627, name: "Kyle Walker", number: 2, pos: "D", grid: "2:4")
          ]),
          substitutes: Players(playersList: [
            Player(
                id: 50828,
                name: "Zack Steffen",
                number: 13,
                pos: "G",
                grid: null),
            Player(
                id: 623,
                name: "Benjamin Mendy",
                number: 22,
                pos: "D",
                grid: null)
          ]),
          coach: Coach(
              id: 4,
              name: "Guardiola",
              photo: "https://media.api-sports.io/football/coachs/4.png")),
      awayLineup: Lineup(
          team: Team(
              id: 45,
              name: "Everton",
              logo: "https://media.api-sports.io/football/teams/45.png"),
          formation: "4-3-1-2",
          startXI: Players(playersList: [
            Player(
                id: 2932,
                name: "Jordan Pickford",
                number: 1,
                pos: "G",
                grid: "1:1"),
            Player(
                id: 19150,
                name: "Mason Holgate",
                number: 4,
                pos: "D",
                grid: "2:4")
          ]),
          substitutes: Players(playersList: [
            Player(
                id: 18755,
                name: "João Virgínia",
                number: 31,
                pos: "G",
                grid: null)
          ]),
          coach: Coach(
              id: 2407,
              name: "C. Ancelotti",
              photo: "https://media.api-sports.io/football/coachs/2407.png")));

  test('should get live matches from the repository', () async {
    //arrange
    when(() => mockFixtureLineupsRepository.getFixtureLineups(any()))
        .thenAnswer((_) async => const Right(tFixtureLineups));
    //act
    final result = await usecase(const LineupsParams(fixtureId: tFixtureId));
    //assert
    expect(result, const Right(tFixtureLineups));
    verify(() => mockFixtureLineupsRepository.getFixtureLineups(tFixtureId));
    verifyNoMoreInteractions(mockFixtureLineupsRepository);
  });
}
