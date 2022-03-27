import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture/fixture_local_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late FixtureLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        FixtureLocalDataSourceImpl(sharedPrefs: mockSharedPreferences);
  });

  group('getLastLiveMatches', () {
    final tLiveMatchesModel = FixtureModel.fromJson(
        json.decode(fixture('fixture_cached.json')));
    test(
        'should return Live Matches from SharedPreferences when there is one in the cache',
        () async {
      //arrange
      when((() => mockSharedPreferences.getString(any())))
          .thenReturn(fixture('fixture_cached.json'));
      //act
      final result = await dataSource.getLastFixture();
      //assert
      verify(() => mockSharedPreferences.getString(CACHED_FIXTURE));
      expect(result, equals(tLiveMatchesModel));
    });

    test('should throw a CacheException when there is no a cached value',
        () async {
      //arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);
      //act
      final call = dataSource.getLastFixture;
      //assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group('cacheFixture', () {
    const tFixtureModel = FixtureModel(
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
          fixtureData: FixtureData(id: 1, date: 'Date', status: Status(elapsed: 1)));
    test('should call SharedPreferences to cache the data', () async {
      //act
      final call = await dataSource.cacheFixture(tFixtureModel);

      //assert
      final expectedJsonString = json.encode(tFixtureModel.toJson());
      print(expectedJsonString);
      verify(
        () => mockSharedPreferences.setString(
            CACHED_FIXTURE, expectedJsonString),
      );
    });
  });
}
