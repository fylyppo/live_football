import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import '../../models/lineup_model.dart';
import 'package:http/http.dart' as http;

abstract class FixtureLineupsRemoteDataSource {
  Future<List<LineupModel>> getFixtureLineups(int fixtureId);
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
  Future<List<LineupModel>> getFixtureLineups(int fixtureId) => _getFixtureLineupsFromUrl('https://v3.football.api-sports.io/fixtures/lineups?fixture=$fixtureId');

  Future<List<LineupModel>> _getFixtureLineupsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      List<dynamic> lineups = body['response'];
      List<LineupModel> lineupModelsList =
          lineups.map((e) => LineupModel.fromJson(e)).toList();
      return lineupModelsList;
    } else {
      throw ServerException();
    }
  }
}