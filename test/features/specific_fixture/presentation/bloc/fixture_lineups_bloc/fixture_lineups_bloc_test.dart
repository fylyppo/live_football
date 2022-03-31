import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:live_football/features/specific_fixture/presentation/bloc/fixture_lineups_bloc/fixture_lineups_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetFixtureLineups extends Mock implements GetFixtureLineups {}

void main() {
  late FixtureLineupsBloc bloc;
  late GetFixtureLineups mockGetFixtureLineups;
  setUp(() {
    mockGetFixtureLineups = MockGetFixtureLineups();
    registerFallbackValue(const LineupsParams(fixtureId: 0));
    bloc = FixtureLineupsBloc(getFixtureLineups: mockGetFixtureLineups);
  });

  test('initialState should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('GetFixtureLineups', () {
    const tFixtureId = 850;
    const tFixtureLineups = Lineups(homeLineup: Lineup(
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
              photo: "https://media.api-sports.io/football/coachs/4.png")), awayLineup: Lineup(
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

    test('should get data from the concrete usecase.', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => const Right(tFixtureLineups));
      //act
      bloc.add(const GetFixtureLineupsForId(tFixtureId));
      await untilCalled(() => mockGetFixtureLineups(any()));
      //assert
      verify(() => mockGetFixtureLineups(const LineupsParams(fixtureId: tFixtureId)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => const Right(tFixtureLineups));
      //assert later
      final expected = [
        Loading(),
        const Loaded(lineups: tFixtureLineups)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureLineupsForId(tFixtureId));
    });

    test('should emit [Loading, Error] when data fails', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureLineupsForId(tFixtureId));
    });

    test('should emit [Loading, Error] with a proper message for the error when getting data fails', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureLineupsForId(tFixtureId));
    });
  });
}