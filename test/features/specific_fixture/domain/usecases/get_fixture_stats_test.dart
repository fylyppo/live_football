import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_stats_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_stats.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockFixtureStatsRepository extends Mock implements FixtureStatsRepository{}

void main() {
  
  late GetFixtureStats usecase;
  late MockFixtureStatsRepository mockFixtureStatsRepository;
  
  setUp(() {
    mockFixtureStatsRepository = MockFixtureStatsRepository();
    usecase = GetFixtureStats(mockFixtureStatsRepository);
  });

  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_stats.json'));
  final response = decoded['response'];
  final tFixtureStats = Stats.fromJson(response);
  test('should get fixture stats from repository', () async {
    //arrange
    when((() => mockFixtureStatsRepository.getFixtureStats(any()))).thenAnswer((_) async => Right(tFixtureStats));
    //act
    final result = await usecase(const FixtureParams(id: tFixtureId));
    //assert
    expect(result, Right(tFixtureStats));
    verify(() => mockFixtureStatsRepository.getFixtureStats(tFixtureId),);
    verifyNoMoreInteractions(mockFixtureStatsRepository);
  });
}