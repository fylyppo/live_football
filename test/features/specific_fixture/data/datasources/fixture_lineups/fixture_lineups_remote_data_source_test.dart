import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/impl/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/lineup_model.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../fixtures/fixture_reader.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';

class MockDio extends Mock implements Dio {}

class MockApiFootballClient extends Mock implements ApiFootballClient {}

void main() {
  late MockDio mockDio;
  late MockApiFootballClient mockApiFootballClient;
  late FixtureLineupsRemoteDataSourceImpl dataSource;

  setUp(() {
        mockDio = MockDio();
    mockApiFootballClient = MockApiFootballClient();
    dataSource = FixtureLineupsRemoteDataSourceImpl(
        dio: mockDio, client: mockApiFootballClient);
  });

  void setMockClientSuccess200() {
    when(
      () => mockApiFootballClient.getLineups(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_lineups.json')),
        Response(
            data: jsonDecode(fixture('fixture_lineups.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''))));
  }

  void setMockClientFailure404() {
    when(
      () => mockApiFootballClient.getLineups(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_lineups.json')),
        Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''))));
  }
  group('getFixtureLineups', () {
    const tFixtureId = 1;
    final decoded = jsonDecode(fixture('fixture_lineups.json'));
    final List<dynamic> response = decoded['response'];
    final List<LineupModel> tLineupModelsList = response.map((e) => LineupModel.fromJson(e),).toList();

    test(
        'should perform a GET on a URL with fixtureId endpoint and with apiKey',
        () async {
      //arrange
      setMockClientSuccess200();
      //act
      dataSource.getFixtureComponent(tFixtureId);
      //assert
      verify(
        () => mockApiFootballClient.getLineups(tFixtureId),
      );
    });

    test('should return Lineups when the response is 200', () async {
      //arrange
      setMockClientSuccess200();
      //act
      final result = await dataSource.getFixtureComponent(tFixtureId);
      //assert
      expect(result, equals(tLineupModelsList));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      setMockClientFailure404();
      //act
      final call = dataSource.getFixtureComponent;
      //assert
      expect(()=> call(tFixtureId), throwsA(isA<ServerException>()));
    });
  });
}