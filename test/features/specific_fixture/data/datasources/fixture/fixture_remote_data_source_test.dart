import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture/fixture_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late FixtureRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = FixtureRemoteDataSourceImpl(client: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  void setUpMockHttpClientSuccess200(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response(fixture('fixture.json'), 200));
  }

  void setUpMockHttpClientFailure404(){
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
          .thenAnswer(
              (_) async => http.Response('Something went wrong', 404));
  }
  group('getFixture', () {
    const tFixtureId = 850;
    
    final Map<String, dynamic> decoded = json.decode(fixture('fixture.json'));
    final Map<String, dynamic> map = decoded['response'];
    final tLiveMatchesModel = FixtureModel.fromJson(map);
    test(
        'should perform a GET on a URL with league endpoint and with application/json header',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSource.getFixture(tFixtureId);
      //assert
      verify(() => mockHttpClient
              .get(Uri.parse('https://v3.football.api-sports.io/fixtures?id=$tFixtureId'), headers: {
            'x-apisports-key': '******************',
          }));
    });

    test('should return LiveMatches when the response is 200', () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getFixture(tFixtureId);
      //assert
      expect(result, equals(tLiveMatchesModel));
    });

    test('should throw a ServerException when the response code is 404 or other', () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getFixture;
      //assert
      expect(()=> call(tFixtureId), throwsA(isA<ServerException>()));
    });
  });
}
