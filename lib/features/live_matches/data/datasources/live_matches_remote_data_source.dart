import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import '../models/live_matches_model.dart';
import 'package:http/http.dart' as http;

abstract class LiveMatchesRemoteDataSource {
  Future<LiveMatchesModel>? getLiveMatches(String? league);
}

class LiveMatchesRemoteDataSourceImpl implements LiveMatchesRemoteDataSource{
  final http.Client client;

  LiveMatchesRemoteDataSourceImpl({required this.client});
  
  @override
  Future<LiveMatchesModel>? getLiveMatches(String? league) => _getLiveMatchesFromUrl('http://fakeapi.com/$league');

  Future<LiveMatchesModel> _getLiveMatchesFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: {
    'Content-Type': 'application/json',
    });
    if(response.statusCode == 200){
      return LiveMatchesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  } 
}