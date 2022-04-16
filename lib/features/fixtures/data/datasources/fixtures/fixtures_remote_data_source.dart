import 'package:dio/dio.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import '../../../../../core/datasources/remote/api_football_client.dart';

abstract class FixturesRemoteDataSource {
  Future<List<FixtureModel>> getFixtures(
      {String? live,
      String? date,
      int? league,
      int? season,
      int? team,
      int? last,
      int? next,
      String? from,
      String? to,
      String? round,
      String? status});
}

class FixturesRemoteDataSourceImpl implements FixturesRemoteDataSource {
  final Dio dio;
  final ApiFootballClient client;

  FixturesRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });

  @override
  Future<List<FixtureModel>> getFixtures(
      {String? live,
      String? date,
      int? league,
      int? season,
      int? team,
      int? last,
      int? next,
      String? from,
      String? to,
      String? round,
      String? status}) async {
    //final dio = Dio();
    //final client = ApiFootballClient(dio);
    final httpResponse = await client.getFixtureModelsList({
      'timezone': 'Europe/Warsaw',
      if(live != null) 'live': live,
      if(date != null) 'date': date,
      if(league != null) 'league': league,
      if(season != null) 'season': season,
      if(team != null) 'team': team,
      if(last != null) 'last': last,
      if(next != null) 'next': next,
      if(from != null) 'from': from,
      if(to != null) 'to': to,
      if(round != null) 'round': round,
      if(status != null) 'status': status,
    });
    if (httpResponse.response.statusCode == 200) {
      List<dynamic> body = httpResponse.response.data['response'];
      List<FixtureModel> fixtureModelsList =
          body.map((e) => FixtureModel.fromJson(e)).toList();
      return fixtureModelsList;
    } else {
      throw ServerException();
    }
  }
}
