import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_stats.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockFixtureStatsRepository extends Mock implements FixtureRepository<List<Stats>> {}

void main() {
  
  late GetFixtureStats usecase;
  late MockFixtureStatsRepository mockFixtureStatsRepository;
  
  setUp(() {
    mockFixtureStatsRepository = MockFixtureStatsRepository();
    usecase = GetFixtureStats(mockFixtureStatsRepository);
  });

  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_stats.json'));
  final List<dynamic> response = decoded['response'];
  final List<StatsModel> tStatsModelsList = response.map((e) => StatsModel.fromJson(e),).toList();
  final List<Stats> tStatsList = tStatsModelsList.map((e) => e.toDomain(),).toList();
  test('should get fixture stats from repository', () async {
    //arrange
    when((() => mockFixtureStatsRepository.getFixtureComponent(any()))).thenAnswer((_) async => Right(tStatsList));
    //act
    final result = await usecase(const FixtureParams(id: tFixtureId));
    //assert
    expect(result, Right(tStatsList));
    verify(() => mockFixtureStatsRepository.getFixtureComponent(tFixtureId),);
    verifyNoMoreInteractions(mockFixtureStatsRepository);
  });
}