import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_events/fixture_events_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/event_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

class MockApiFootballClient extends Mock implements ApiFootballClient {}

void main() {
  late MockDio mockDio;
  late MockApiFootballClient mockApiFootballClient;
  late FixtureEventsRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    mockApiFootballClient = MockApiFootballClient();
    dataSource = FixtureEventsRemoteDataSourceImpl(
        dio: mockDio, client: mockApiFootballClient);
  });

  void setMockClientSuccess200() {
    when(
      () => mockApiFootballClient.getEvents(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_events.json')),
        Response(
            data: jsonDecode(fixture('fixture_events.json')),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''))));
  }

  void setMockClientFailure404() {
    when(
      () => mockApiFootballClient.getEvents(any()),
    ).thenAnswer((_) async => HttpResponse(
        jsonDecode(fixture('fixture_events.json')),
        Response(
            data: 'Something went wrong',
            statusCode: 404,
            requestOptions: RequestOptions(path: ''))));
  }

  const tFixtureId = 1;
  final decoded = json.decode(fixture('fixture_events.json'));
  final List<dynamic> response = decoded['response'];
  final List<EventModel> tEventsModelsList =
      response.map((e) => EventModel.fromJson(e)).toList();

  group('getEvents', () {
    test(
        'should perform a GET on a URL with fixtureId endpoint and with apiKey',
        () async {
      //arrange
      setMockClientSuccess200();
      //act
      dataSource.getFixtureEvents(tFixtureId);
      //assert
      verify(
        () => mockApiFootballClient.getEvents(tFixtureId),
      );
    });

    test('should return Events when the response is 200', () async {
      //arrange
      setMockClientSuccess200();
      //act
      final result = await dataSource.getFixtureEvents(tFixtureId);
      //assert
      expect(result, equals(tEventsModelsList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      //arrange
      setMockClientFailure404();
      //act
      final call = dataSource.getFixtureEvents;
      //assert
      expect(() => call(tFixtureId), throwsA(isA<ServerException>()));
    });
  });
}
