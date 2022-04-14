import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_events/fixture_events_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/events_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late FixtureEventsRemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = FixtureEventsRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  const tFixtureId = 1;
  final Map<String, dynamic> decoded = json.decode(fixture('fixture_events.json'));
    final List<dynamic> map = decoded['response'];
    final tEventsModel = EventsModel.fromJson(map);

  test('should perform a GET on a URL with fixtureId endpoint and with apiKey', () async {
    //arrange
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response(fixture('fixture_events.json'), 200));
    //act
    dataSource.getFixtureEvents(tFixtureId);
    //assert
    verify(() => mockHttpClient.get(Uri.parse('https://v3.football.api-sports.io/fixtures/events?fixture=$tFixtureId'), headers: {
            'x-apisports-key': '******************',
          }));
  });

  test('should return Events when the response is 200', () async {
      //arrange
      //setUpMockHttpClientSuccess200();
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response(fixture('fixture_events.json'), 200));
      //act
      final result = await dataSource.getFixtureEvents(tFixtureId);
      //assert
      expect(result, equals(tEventsModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      //setUpMockHttpClientFailure404();
      when(() => mockHttpClient.get(any(), headers: any(named: 'headers'))).thenAnswer((_) async => http.Response('Something went wrong', 404));
      //act
      final call = dataSource.getFixtureEvents;
      //assert
      expect(()=> call(tFixtureId), throwsA(isA<ServerException>()));
    });
}