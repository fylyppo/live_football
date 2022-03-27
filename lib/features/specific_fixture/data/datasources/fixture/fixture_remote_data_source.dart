import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import '../../models/fixture_model.dart';
import 'package:http/http.dart' as http;

abstract class FixtureRemoteDataSource {
  Future<FixtureModel>? getFixture(int id);
}

class FixtureRemoteDataSourceImpl implements FixtureRemoteDataSource{
  final http.Client client;

  static const apiKey = "******************";
  static const headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': apiKey
  };
  
  FixtureRemoteDataSourceImpl({required this.client});
  
  @override
  Future<FixtureModel>? getFixture(int id) => _getFixtureFromUrl('https://v3.football.api-sports.io/fixtures?id=$id');

  Future<FixtureModel> _getFixtureFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var firstFixture = body['response'];
      
      return FixtureModel.fromJson(firstFixture);
    } else {
      throw ServerException();
    }
  } 
}