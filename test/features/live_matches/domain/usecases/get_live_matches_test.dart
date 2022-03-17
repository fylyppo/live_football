import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';
import 'package:live_football/features/live_matches/domain/usecases/get_live_matches.dart';
import 'package:mocktail/mocktail.dart';

class MockLiveMatchesRepository extends Mock implements LiveMatchesRepository{

}

void main() {
  GetLiveMatches usecase;
  MockLiveMatchesRepository? mockLiveMatchesRepository;

  setUp(() {
    mockLiveMatchesRepository = MockLiveMatchesRepository();
    
  });

  const String tleague= 'live?=true';
  const tId = 1;
  const tLiveMatches = LiveMatches(matches: [Match(fixture: Fixture(id: tId, referee: 'referee'))]);
  
  test('should get live matches from the repository', () async {
    usecase = GetLiveMatches(mockLiveMatchesRepository!);
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