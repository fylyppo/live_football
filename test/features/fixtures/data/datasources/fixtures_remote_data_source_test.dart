import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/fixtures/data/datasources/fixtures/fixtures_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

class MockApiFootballClient extends Mock implements ApiFootballClient {}

void main() {
  late MockDio mockDio;
  late MockApiFootballClient mockApiFootballClient;
  late FixturesRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    mockApiFootballClient = MockApiFootballClient();
    dataSource = FixturesRemoteDataSourceImpl(
        dio: mockDio, client: mockApiFootballClient);
    //registerFallbackValue({});
  });

  void setMockClientSuccess200() {
    when(
      () => mockApiFootballClient.getFixtureModelsList(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixtures.json')),
        Response(
            data: jsonDecode(fixture('fixtures.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''))));
  }

  void setMockClientFailure404() {
    when(
      () => mockApiFootballClient.getFixtureModelsList(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixtures.json')),
        Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''))));
  }

  group('getFixtures', () {
  final decoded = jsonDecode(fixture('fixtures.json'));
  final List<dynamic> response = decoded['response'];
  final List<FixtureModel> tFixturesModelsList = response.map((e) => FixtureModel.fromJson(e),).toList();

    test('should should perform a GET on a URL with live endpoint', () {
      //arrange
      setMockClientSuccess200();
      //act
      dataSource.getFixtures(live: 'all');
      //assert
      verify(
        () => mockApiFootballClient.getFixtureModelsList({'live': 'all'}),
      );
    });

    test('should return List<FixtureModel> when the response is 200', () async {
      //arrange
      setMockClientSuccess200();
      //act
      final result = await dataSource.getFixtures(live: 'all');
      //assert
      expect(result, equals(tFixturesModelsList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () {
      //arrange
      setMockClientFailure404();
      //act
      final call = dataSource.getFixtures(live: 'all');
      //assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
