import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/impl/fixture/fixture_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import '../../../../../fixtures/fixture_reader.dart';
import 'package:retrofit/dio.dart';

class MockDio extends Mock implements Dio {}

class MockApiFootballClient extends Mock implements ApiFootballClient {}
void main() {
  late FixtureRemoteDataSourceImpl dataSource;
  late MockDio mockDio;
  late MockApiFootballClient mockApiFootballClient;

  setUp(() {
     mockDio = MockDio();
    mockApiFootballClient = MockApiFootballClient();
    dataSource = FixtureRemoteDataSourceImpl(
        dio: mockDio, client: mockApiFootballClient);
  });

  void setMockClientSuccess200() {
    when(
      () => mockApiFootballClient.getFixture(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture.json')),
        Response(
            data: jsonDecode(fixture('fixture.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''))));
  }

  void setMockClientFailure404() {
    when(
      () => mockApiFootballClient.getFixture(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture.json')),
        Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''))));
  }
  group('getFixture', () {
    const tFixtureId = 1;
    final Map<String, dynamic> decoded = json.decode(fixture('fixture.json'));
    final List<dynamic> fixturesListJson = decoded['response'];
    final tFixtureModel = FixtureModel.fromJson(fixturesListJson[0]);
    test(
        'should perform a GET on a URL with league endpoint and with application/json header',
        () async {
      //arrange
      setMockClientSuccess200();
      //act
      dataSource.getFixture(tFixtureId);
      //assert
      verify(
        () => mockApiFootballClient.getFixture(tFixtureId),
      );
    });

    test('should return FixtureModel when the response is 200', () async {
      //arrange
      setMockClientSuccess200();
      //act
      final result = await dataSource.getFixture(tFixtureId);
      //assert
      expect(result, equals(tFixtureModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      setMockClientFailure404();
      //act
      final call = dataSource.getFixture;
      //assert
      expect(()=> call(tFixtureId), throwsA(isA<ServerException>()));
    });
  });
}
