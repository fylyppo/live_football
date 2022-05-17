import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:mocktail/mocktail.dart';

class MockFixtureRepository extends Mock implements FixtureRepository<Fixture> {}

void main() {
  late GetFixture usecase;
  late MockFixtureRepository mockFixtureRepository;

  setUp(() {
    mockFixtureRepository = MockFixtureRepository();
    usecase = GetFixture(mockFixtureRepository);
  });

  const tFixtureId = 1;
  var tFixture = Fixture(
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
          fixture: FixtureData(id: 1, date: 'Date', status: Status(elapsed: 1, long: '', short: ''), venue: Venue(id: 1, name: 'name', city: 'city'), referee: '', timestamp: 1));
  
  test('should get live matches from the repository', () async {
    
    //arrange
    when(() => mockFixtureRepository.getFixtureComponent(any())).thenAnswer((_) async => Right(tFixture));
    //act
    final result = await usecase(const FixtureParams(id: tFixtureId));
    //assert
    expect(result, Right(tFixture));
    verify(() => mockFixtureRepository.getFixtureComponent(tFixtureId));
    verifyNoMoreInteractions(mockFixtureRepository);
  });
}