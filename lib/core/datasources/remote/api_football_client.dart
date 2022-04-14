import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api_football_client.g.dart';

@RestApi(baseUrl: "https://v3.football.api-sports.io/")
abstract class ApiFootballClient {
  factory ApiFootballClient(Dio dio, {String baseUrl}) = _ApiFootballClient;

  @GET("/fixtures")
  @Headers(<String, dynamic>{
      'x-apisports-key': '**************'
  })
  Future<HttpResponse> getFixtureModelsList(@Queries() Map<String, dynamic> queries);
}