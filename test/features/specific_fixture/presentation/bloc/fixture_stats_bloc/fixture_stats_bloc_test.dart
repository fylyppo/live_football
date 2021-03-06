import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/error/messages/messages.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_stats.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_stats_bloc/fixture_stats_bloc.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockGetFixtureStats extends Mock implements GetFixtureStats {}

void main() {
  late MockGetFixtureStats mockGetFixtureStats;
  late FixtureStatsBloc bloc;

  setUp(() {
    mockGetFixtureStats = MockGetFixtureStats();
    bloc = FixtureStatsBloc(getFixtureStats: mockGetFixtureStats);
    registerFallbackValue(const FixtureParams(id: 1));
  });

  test('initialState should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });
  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_stats.json'));
  final List<dynamic> response = decoded['response'];
  final List<StatsModel> tStatsModelsList = response.map((e) => StatsModel.fromJson(e),).toList();
  final List<Stats> tStatsList = tStatsModelsList.map((e) => e.toDomain(),).toList();

  test('should get data from the concrete usecase', () async {
    //arrange
    when(() => mockGetFixtureStats(any()),).thenAnswer((_) async => Right(tStatsList));
    //act
    bloc.add(const GetFixtureStatsForId(tFixtureId));
    await untilCalled(() => mockGetFixtureStats(any()),);
    //assert
    verify(() => mockGetFixtureStats(const FixtureParams(id: tFixtureId)),);
  });

  test('should emit [Loading, Loaded] when data is gotten successfully', () {
    when(() => mockGetFixtureStats(any()),).thenAnswer((_) async => Right(tStatsList));
    //assert later
    final expected = [
        Loading(),
        Loaded(stats: tStatsList)
      ];
    expectLater(bloc.stream, emitsInOrder(expected));
    //act
    bloc.add(const GetFixtureStatsForId(tFixtureId));
  });

  test('should emit [Loading, LError] when data fails', () {
    when(() => mockGetFixtureStats(any()),).thenAnswer((_) async => Left(ServerFailure()));
    //assert later
    final expected = [
        Loading(),
        const Error(message: SERVER_FAILURE_MESSAGE)
      ];
    expectLater(bloc.stream, emitsInOrder(expected));
    //act
    bloc.add(const GetFixtureStatsForId(tFixtureId));
  });
}