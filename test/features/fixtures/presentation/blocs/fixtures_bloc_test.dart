import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:live_football/features/fixtures/presentation/blocs/bloc/fixtures_bloc.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockGetFixtures extends Mock implements GetFixtures {}

void main() {
  late FixturesBloc bloc;
  late MockGetFixtures mockGetFixtures;
  
  
  setUp(() {
    registerFallbackValue(const FixturesParams(live: ''));
    mockGetFixtures = MockGetFixtures();
    bloc = FixturesBloc(getFixtures: mockGetFixtures);
  });

  test('initial state should be FixturesState.initial()', () {
    expect(bloc.state, equals(const FixturesState.initial()));
  });

  group('GetFixtures', () {
    final Map<String, dynamic> decoded = jsonDecode(fixture('fixtures.json'));
    final List<dynamic> response = decoded['response'];
    final List<FixtureModel> tFixturesModelsList = response.map((e) => FixtureModel.fromJson(e),).toList();
    final List<Fixture> tFixturesList = tFixturesModelsList.map((e) => e.toDomain(),).toList();

    const tFixtureLive = 'all';
    test('should get data from the concrete usecase', () async {
      //arrange
      when(() => mockGetFixtures(any())).thenAnswer((_) async => Right(tFixturesList));
      //act
      bloc.add(const FixturesEvent.getFixturesForParameters(live: tFixtureLive));
      await untilCalled(() => mockGetFixtures(any()),);
      //assert
      verify(() => mockGetFixtures(const FixturesParams(live: tFixtureLive)),);
    });

    test('should emit [Loading, Loaded] when data is gotten successfully', () {
      //arrange
      when(() => mockGetFixtures(any())).thenAnswer((_) async => Right(tFixturesList));
      //assert later
      final expected = [
        const FixturesState.loading(),
        FixturesState.loaded(fixtures: tFixturesList),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const FixturesEvent.getFixturesForParameters(live: tFixtureLive));
    });

    test('should emit [Loading, Error] when data fails', () {
      //arrange
      when(() => mockGetFixtures(any())).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        const FixturesState.loading(),
        const FixturesState.fixturesError(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const FixturesEvent.getFixturesForParameters(live: tFixtureLive));
    });

    test('should emit [Loading, Error] with a proper message for the error when getting data fails', () {
      //arrange
      when(() => mockGetFixtures(any())).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        const FixturesState.loading(),
        const FixturesState.fixturesError(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(const FixturesEvent.getFixturesForParameters(live: tFixtureLive));
    });
  });
}