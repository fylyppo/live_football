import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_football/core/error/exceptions.dart';

import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';

abstract class FixtureStatsRemoteDataSource {
  Future<List<StatsModel>> getFixtureStats(int id);
}

class FixtureStatsRemoteDataSourceImpl implements FixtureStatsRemoteDataSource {
  final http.Client client;

  static const apiKey = "******************";
  static const headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': apiKey
  };

  FixtureStatsRemoteDataSourceImpl({
    required this.client,
  });
  
  @override
  Future<List<StatsModel>> getFixtureStats(int fixtureId) => _getFixtureStatsFromUrl('https://v3.football.api-sports.io/fixtures/statistics?fixture=$fixtureId');

  Future<List<StatsModel>> _getFixtureStatsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List<dynamic> stats = body['response'];
      List<StatsModel> statsModelsList =
          stats.map((e) => StatsModel.fromJson(e)).toList();
      return statsModelsList;
    } else {
      throw ServerException();
    }

  }

}
