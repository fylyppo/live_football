import 'package:live_football/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/datasources/remote/api_football_client.dart';
import '../../../models/fixture_model.dart';

abstract class FixtureRemoteDataSource {
  Future<FixtureModel> getFixture(int id);
}

class FixtureRemoteDataSourceImpl implements FixtureRemoteDataSource{
  final Dio dio;
  final ApiFootballClient client;

  FixtureRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });
  
  @override
  Future<FixtureModel> getFixture(int id) async {
    final httpResponse = await client.getFixture(id);
    if(httpResponse.response.statusCode == 200){
      List<dynamic> body = httpResponse.response.data['response'];
      FixtureModel fixture = FixtureModel.fromJson(body[0]);
      return fixture;
    } else {
      throw ServerException();
    }
  } 
}