import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/entities/team.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';
import 'package:live_football/features/live_matches/domain/usecases/get_live_matches.dart';
import 'package:mocktail/mocktail.dart';

class MockLiveMatchesRepository extends Mock implements LiveMatchesRepository{

}

void main() {
  late GetLiveMatches usecase;
  MockLiveMatchesRepository? mockLiveMatchesRepository;

  setUp(() {
    mockLiveMatchesRepository = MockLiveMatchesRepository();
    usecase = GetLiveMatches(mockLiveMatchesRepository!);
  });

  const String tleague= 'live?=true';
  const tId = 1;
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
  
  test('should get live matches from the repository', () async {
    
    //arrange
    when(() => mockLiveMatchesRepository!.getLiveMatches(any())).thenAnswer((_) async => const Right(tLiveMatches));
    //act
    final result = await usecase(const Params(league: tleague));
    //assert
    expect(result, const Right(tLiveMatches));
    verify(() => mockLiveMatchesRepository!.getLiveMatches(tleague));
    verifyNoMoreInteractions(mockLiveMatchesRepository);
  });
}