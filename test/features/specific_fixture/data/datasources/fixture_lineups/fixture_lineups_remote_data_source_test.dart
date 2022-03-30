import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/lineups_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late FixtureLineupsRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = FixtureLineupsRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  void setUpMockHttpClientSuccess200(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response(fixture('fixture_lineups.json'), 200));
  }

  void setUpMockHttpClientFailure404(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response('Something went wrong', 404));
  }
  group('getFixtureLineups', () {
    const tFixtureId = 592872;
    final Map<String, dynamic> decoded = json.decode(fixture('fixture_lineups.json'));
    final List<dynamic> map = decoded['response'];
    final tLineupsModel = LineupsModel.fromJson(map);

    test(
        'should perform a GET on a URL with fixtureId endpoint and with apiKey',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSource.getFixtureLineups(tFixtureId);
      //assert
      verify(() => mockHttpClient
              .get(Uri.parse('https://v3.football.api-sports.io/fixtures/lineups?fixture=$tFixtureId'), headers: {
            'x-apisports-key': '******************',
          }));
    });

    test('should return Lineups when the response is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getFixtureLineups(tFixtureId);
      //assert
      expect(result, equals(tLineupsModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getFixtureLineups;
      //assert
      expect(()=> call(tFixtureId), throwsA(isA<ServerException>()));
    });
  });
}