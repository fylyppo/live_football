import 'package:dio/dio.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';

import '../../../../../core/datasources/remote/api_football_client.dart';

abstract class FixtureStatsRemoteDataSource {
  Future<List<StatsModel>> getFixtureStats(int id);
}

class FixtureStatsRemoteDataSourceImpl implements FixtureStatsRemoteDataSource {
  final Dio dio;
  final ApiFootballClient client;

  FixtureStatsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });
  
  @override
  Future<List<StatsModel>> getFixtureStats(int id) async {
    final httpResponse = await client.getStats(id);
    if(httpResponse.response.statusCode == 200){
      List<dynamic> body = httpResponse.response.data['response'];
      List<StatsModel> statsModelsList =
          body.map((e) => StatsModel.fromJson(e)).toList();
      return statsModelsList;
    } else {
      throw ServerException();
    }

  }

}
