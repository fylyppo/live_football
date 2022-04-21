import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/core/utils/input_converter.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_bloc/fixture_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetFixture extends Mock implements GetFixture {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late FixtureBloc bloc;
  late MockGetFixture mockGetFixture;
  late MockInputConverter mockInputConverter;
  setUp(() {
    mockGetFixture = MockGetFixture();
    mockInputConverter = MockInputConverter();
    registerFallbackValue(const FixtureParams(id: 0));
    bloc = FixtureBloc(getFixture: mockGetFixture, inputConverter: mockInputConverter);
  });

  test('initialState should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('GetFixture', () {
    const tFixtureId = 850;
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

    test('should get data from the concrete usecase.', () async {
      //arrange
      when(()=> mockGetFixture(any())).thenAnswer((_) async => Right(tFixture));
      //act
      bloc.add(const GetFixtureForId(tFixtureId));
      await untilCalled(() => mockGetFixture(any()));
      //assert
      verify(() => mockGetFixture(const FixtureParams(id: tFixtureId)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () async {
      //arrange
      when(()=> mockGetFixture(any())).thenAnswer((_) async => Right(tFixture));
      //assert later
      final expected = [
        Loading(),
        Loaded(fixture: tFixture, status: '')
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureForId(tFixtureId));
    });

    test('should emit [Loading, Error] when data fails', () async {
      //arrange
      when(()=> mockGetFixture(any())).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureForId(tFixtureId));
    });

    test('should emit [Loading, Error] with a proper message for the error when getting data fails', () async {
      //arrange
      when(()=> mockGetFixture(any())).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        Loading(),
        const Error(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const GetFixtureForId(tFixtureId));
    });
  });
}