import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/util/input_converter.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/entities/team.dart';
import 'package:live_football/features/live_matches/domain/usecases/get_live_matches.dart';
import 'package:live_football/features/live_matches/presentation/bloc/live_matches_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetLiveMatches extends Mock implements GetLiveMatches {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late LiveMatchesBloc bloc;
  late MockGetLiveMatches mockGetLiveMatches;
  late MockInputConverter mockInputConverter;
  setUp(() {
    mockGetLiveMatches = MockGetLiveMatches();
    mockInputConverter = MockInputConverter();
    registerFallbackValue(const Params(league: ''));
    bloc = LiveMatchesBloc(getLiveMatches: mockGetLiveMatches, inputConverter: mockInputConverter);
  });

  test('initialState should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('GetLiveMatches', () {
    const tLeagueString = 'Premier League';
    const tLiveMatches = LiveMatches(matches: [Match(
          league: League(
              id: 1,
              name: 'Premier League',
              logo: 'logo',
              flag: 'flag',
              round: 'Round 1'),
          teams: Teams(
              home: Team(id: 1, name: 'Arsenal', logo: 'logo'),
              away: Team(id: 2, name: 'Chelsea', logo: 'logo')),
          goals: Goals(home: 1, away: 2),
          fixture: Fixture(id: 1, date: 'Date', status: Status(elapsed: 1)))]);

    test('should get data from the concrete usecase.', () async {
      //arrange
      when(()=> mockGetLiveMatches(any())).thenAnswer((_) async => const Right(tLiveMatches));
      //act
      bloc.add(const GetLiveMatchesForLeague(tLeagueString));
      await untilCalled(() => mockGetLiveMatches(any()));
      //assert
      verify(() => mockGetLiveMatches(const Params(league: tLeagueString)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () async {
      //arrange
      when(()=> mockGetLiveMatches(any())).thenAnswer((_) async => const Right(tLiveMatches));
      //assert later
      final expected = [
        Loading(),
        const Loaded(liveMatches: tLiveMatches)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetLiveMatchesForLeague(tLeagueString));
    });

    test('should emit [Loading, Error] when data fails', () async {
      //arrange
      when(()=> mockGetLiveMatches(any())).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetLiveMatchesForLeague(tLeagueString));
    });

    test('should emit [Loading, Error] with a proper message for the error when getting data fails', () async {
      //arrange
      when(()=> mockGetLiveMatches(any())).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetLiveMatchesForLeague(tLeagueString));
    });
  });
}

