import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_local_data_source.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LiveMatchesLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() async {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        LiveMatchesLocalDataSourceImpl(sharedPrefs: mockSharedPreferences);
  });

  group('getLastLiveMatches', () {
    final tLiveMatchesModel = LiveMatchesModel.fromJson(
        json.decode(fixture('live_matches_cached.json')));
    test(
        'should return Live Matches from SharedPreferences when there is one in the cache',
        () async {
      //arrange
      when((() => mockSharedPreferences.getString(any())))
          .thenReturn(fixture('live_matches_cached.json'));
      //act
      final result = await dataSource.getLastLiveMatches();
      //assert
      verify(() => mockSharedPreferences.getString(CACHED_LIVE_MATCHES));
      expect(result, equals(tLiveMatchesModel));
    });

    test('should throw a CacheException when there is no a cached value',
        () async {
      //arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);
      //act
      final call = dataSource.getLastLiveMatches;
      //assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
  });

  group('cacheLiveMatches', () {
    const tLiveMatchesModel = LiveMatchesModel(matches: [
      Match(
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
          fixture: Fixture(id: 1, date: 'Date', status: Status(elapsed: 1)))
    ]);
    test('should call SharedPreferences to cache the data', () async {
      //act
      final call = await dataSource.cacheLiveMatches(tLiveMatchesModel);

      //assert
      final expectedJsonString = json.encode(tLiveMatchesModel.toJson());
      print(expectedJsonString);
      verify(
        () => mockSharedPreferences.setString(
            CACHED_LIVE_MATCHES, expectedJsonString),
      );
    });
  });
}
