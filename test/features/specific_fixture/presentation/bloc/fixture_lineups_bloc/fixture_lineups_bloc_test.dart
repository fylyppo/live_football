import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/features/specific_fixture/data/models/lineup_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineup.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../fixtures/fixture_reader.dart';

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
    final decoded = jsonDecode(fixture('fixture_lineups.json'));
    final List<dynamic> response = decoded['response'];
    final List<LineupModel> tLineupModelsList = response.map((e) => LineupModel.fromJson(e),).toList();
    final List<Lineup> tLineupList = tLineupModelsList.map((e) => e.toDomain(),).toList();

    test('should get data from the concrete usecase', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => Right(tLineupList));
      //act
      bloc.add(const GetFixtureLineupsForId(tFixtureId));
      await untilCalled(() => mockGetFixtureLineups(any()));
      //assert
      verify(() => mockGetFixtureLineups(const LineupsParams(fixtureId: tFixtureId)));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () async {
      //arrange
      when(()=> mockGetFixtureLineups(any())).thenAnswer((_) async => Right(tLineupList));
      //assert later
      final expected = [
        Loading(),
        Loaded(lineups: tLineupList)
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