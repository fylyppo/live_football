import 'package:live_football/core/error/exceptions.dart';
import '../../../../../core/datasources/remote/api_football_client.dart';
import '../../models/lineup_model.dart';
import 'package:dio/dio.dart';

abstract class FixtureLineupsRemoteDataSource {
  Future<List<LineupModel>> getFixtureLineups(int fixtureId);
}

class FixtureLineupsRemoteDataSourceImpl implements FixtureLineupsRemoteDataSource{
  final Dio dio;
  final ApiFootballClient client;

  FixtureLineupsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });
  
  @override
  Future<List<LineupModel>> getFixtureLineups(int id) async {
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