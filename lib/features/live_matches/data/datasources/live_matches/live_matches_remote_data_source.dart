import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import '../../models/live_matches_model.dart';
import 'package:http/http.dart' as http;

abstract class LiveMatchesRemoteDataSource {
  Future<LiveMatchesModel>? getLiveMatches(String? league);
}

class LiveMatchesRemoteDataSourceImpl implements LiveMatchesRemoteDataSource{
  final http.Client client;

  static const apiKey = "******************";
  static const headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': apiKey
  };
  
  LiveMatchesRemoteDataSourceImpl({required this.client});
  
  @override
  Future<LiveMatchesModel>? getLiveMatches(String? league) => _getLiveMatchesFromUrl('https://v3.football.api-sports.io/fixtures?live=all');

  Future<LiveMatchesModel> _getLiveMatchesFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var firstMatch = body['response'][0];
      
      return LiveMatchesModel.fromJson(firstMatch);
    } else {
      throw ServerException();
    }
  } 
}