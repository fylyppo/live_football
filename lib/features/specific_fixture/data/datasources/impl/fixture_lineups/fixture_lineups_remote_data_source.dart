import 'package:live_football/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/datasources/remote/api_football_client.dart';
import '../../../models/lineup_model.dart';
import '../../fixture_component_remote_data_source.dart';

class FixtureLineupsRemoteDataSourceImpl implements FixtureComponentRemoteDataSource<List<LineupModel>> {
  final Dio dio;
  final ApiFootballClient client;

  FixtureLineupsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });
  
  @override
  Future<List<LineupModel>> getFixtureComponent(int id) async {
    final httpResponse = await client.getLineups(id);
    if(httpResponse.response.statusCode == 200){
      List<dynamic> body = httpResponse.response.data['response'];
      List<LineupModel> lineupModelsList =
          body.map((e) => LineupModel.fromJson(e)).toList();
      return lineupModelsList;
    } else {
      throw ServerException();
    }
  }
}