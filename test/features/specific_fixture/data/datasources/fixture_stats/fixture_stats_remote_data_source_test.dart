import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_stats/fixture_stats_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}
void main() {
  late MockHttpClient mockHttpClient;
  late FixtureStatsRemoteDataSource remoteDataSource;
  
  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = FixtureStatsRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_stats.json'));
  final List<dynamic> response = decoded['response'];
  final List<StatsModel> tStatsModelsList = response.map((e) => StatsModel.fromJson(e),).toList();
  //final List<Stats> tStatsList = tStatsModelsList.map((e) => e.toDomain(),).toList();
    test('should perform a GET on a URL with fixtureId endpoint and with apiKey', () {
      //arrange
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response(fixture('fixture_stats.json'), 200));
      //act
      remoteDataSource.getFixtureStats(tFixtureId);
      //assert
      verify(() => mockHttpClient.get(Uri.parse('https://v3.football.api-sports.io/fixtures/statistics?fixture=$tFixtureId'), headers: {
            'x-apisports-key': '******************',
          }),);
  });

  test('should return stats model when response is 200', () async {
    //arrange
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response(fixture('fixture_stats.json'), 200));
    //act
    final result = await remoteDataSource.getFixtureStats(tFixtureId);
    //assert
    expect(result, equals(tStatsModelsList));
  });

  test('should throw a ServerException when the response code is 404 or other', () async {
    //arrange
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response('failure', 404));
    //act
    final call = remoteDataSource.getFixtureStats(tFixtureId);
    //assert
    expect(() => call, throwsA(isA<ServerException>()));
  });
}