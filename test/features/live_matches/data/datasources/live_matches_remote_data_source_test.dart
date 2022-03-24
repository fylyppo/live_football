import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_remote_data_source.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late LiveMatchesRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = LiveMatchesRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  void setUpMockHttpClientSuccess200(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response(fixture('live_matches.json'), 200));
  }

  void setUpMockHttpClientFailure404(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response('Something went wrong', 404));
  }
  group('getLiveMatches', () {
    const tLeague = 'Premier League';
    final tLiveMatchesModel =
        LiveMatchesModel.fromJson(json.decode(fixture('live_matches.json')));

    test(
        'should perform a GET on a URL with league endpoint and with application/json header',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSource.getLiveMatches(tLeague);
      //assert
      verify(() => mockHttpClient
              .get(Uri.parse('https://v3.football.api-sports.io/fixtures?live=all'), headers: {
            'x-apisports-key': '****',
          }));
    });

    test('should return LiveMatches when the response is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getLiveMatches(tLeague);
      //assert
      expect(result, equals(tLiveMatchesModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getLiveMatches;
      //assert
      expect(()=> call(tLeague), throwsA(isA<ServerException>()));
    });
  });
}
