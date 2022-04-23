import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api_football_client.g.dart';

@RestApi(baseUrl: "https://v3.football.api-sports.io/")
abstract class ApiFootballClient {
  factory ApiFootballClient(Dio dio, {String baseUrl}) = _ApiFootballClient;

  @GET("/fixtures")
  Future<HttpResponse> getFixtures(@Queries() Map<String, dynamic> queries);

  @GET("/fixtures")
  Future<HttpResponse> getFixture(@Query('id') int id);

  @GET("/fixtures/events")
  Future<HttpResponse> getEvents(@Query('fixture') int id);

  @GET("/fixtures/lineups")
  Future<HttpResponse> getLineups(@Query('fixture') int id);

  @GET("/fixtures/statistics")
  Future<HttpResponse> getStats(@Query('fixture') int id);
}