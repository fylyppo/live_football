import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import '../../models/lineups_model.dart';
import 'package:http/http.dart' as http;

abstract class FixtureLineupsRemoteDataSource {
  Future<LineupsModel>? getFixtureLineups(int fixtureId);
}

class FixtureLineupsRemoteDataSourceImpl implements FixtureLineupsRemoteDataSource{
  final http.Client client;

  static const apiKey = "******************";
  static const headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': apiKey
  };
  
  FixtureLineupsRemoteDataSourceImpl({required this.client});
  
  @override
  Future<LineupsModel>? getFixtureLineups(int fixtureId) => _getFixtureLineupsFromUrl('https://v3.football.api-sports.io/fixtures/lineups/id?=$fixtureId');

  Future<LineupsModel> _getFixtureLineupsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var lineups = body['response'];
      return LineupsModel.fromJson(lineups);
    } else {
      throw ServerException();
    }
  }
}