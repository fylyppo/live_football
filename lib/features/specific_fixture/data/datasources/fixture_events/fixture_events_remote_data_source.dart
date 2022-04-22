import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/error/exceptions.dart';
import '../../models/event_model.dart';

abstract class FixtureEventsRemoteDataSource {
  Future<List<EventModel>> getFixtureEvents(int fixtureId);
}

class FixtureEventsRemoteDataSourceImpl implements FixtureEventsRemoteDataSource {
  final http.Client client;
  
  FixtureEventsRemoteDataSourceImpl({
    required this.client,
  });
  
  static const apiKey = "******************";
  static const headers = {
    //'x-rapidapi-host': "v3.football.api-sports.io",
    'x-apisports-key': apiKey
  };

  @override
  Future<List<EventModel>> getFixtureEvents(int fixtureId) => _getFixtureEventsFromUrl('https://v3.football.api-sports.io/fixtures/events?fixture=$fixtureId');

  Future<List<EventModel>> _getFixtureEventsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      List<dynamic> events = body['response'];
      List<EventModel> eventModelsList =
          events.map((e) => EventModel.fromJson(e)).toList();
      return eventModelsList;
    } else {
      throw ServerException();
    }
  }
}
