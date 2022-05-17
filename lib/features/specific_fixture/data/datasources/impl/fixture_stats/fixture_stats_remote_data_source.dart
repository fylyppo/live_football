import 'package:dio/dio.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/models/stats_model.dart';
import '../../../../../../core/datasources/remote/api_football_client.dart';
import '../../fixture_component_remote_data_source.dart';

class FixtureStatsRemoteDataSourceImpl implements FixtureComponentRemoteDataSource<List<StatsModel>> {
  final Dio dio;
  final ApiFootballClient client;

  FixtureStatsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });
  
  @override
  Future<List<StatsModel>> getFixtureComponent(int id) async {
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
