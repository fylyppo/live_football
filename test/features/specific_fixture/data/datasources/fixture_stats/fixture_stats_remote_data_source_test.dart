import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_stats/fixture_stats_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

class MockApiFootballClient extends Mock implements ApiFootballClient {}

void main() {
  late MockDio mockDio;
  late MockApiFootballClient mockApiFootballClient;
  late FixtureStatsRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    mockApiFootballClient = MockApiFootballClient();
    dataSource = FixtureStatsRemoteDataSourceImpl(
        dio: mockDio, client: mockApiFootballClient);
  });

  void setMockClientSuccess200() {
    when(
      () => mockApiFootballClient.getStats(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_stats.json')),
        Response(
            data: jsonDecode(fixture('fixture_stats.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''))));
  }

  void setMockClientFailure404() {
    when(
      () => mockApiFootballClient.getStats(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_stats.json')),
        Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''))));
  }

  const tFixtureId = 1;
  final decoded = jsonDecode(fixture('fixture_stats.json'));
  final List<dynamic> response = decoded['response'];
  final List<StatsModel> tStatsModelsList = response.map((e) => StatsModel.fromJson(e),).toList();
  //final List<Stats> tStatsList = tStatsModelsList.map((e) => e.toDomain(),).toList();

  group('getStats', () {
    test(
        'should perform a GET on a URL with fixtureId endpoint and with apiKey',
        () {
      //arrange
      setMockClientSuccess200();
      //act
      dataSource.getFixtureStats(tFixtureId);
      //assert
      verify(
        () => mockApiFootballClient.getStats(tFixtureId),
      );
    });

    test('should return stats model when response is 200', () async {
      //arrange
      setMockClientSuccess200();
      //act
      final result = await dataSource.getFixtureStats(tFixtureId);
      //assert
      expect(result, equals(tStatsModelsList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      //arrange
      setMockClientFailure404();
      //act
      final call = dataSource.getFixtureStats(tFixtureId);
      //assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
