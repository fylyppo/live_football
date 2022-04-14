import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/error/exceptions.dart';
import '../../models/events_model.dart';

abstract class FixtureEventsRemoteDataSource {
  Future<EventsModel?> getFixtureEvents(int fixtureId);
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
  Future<EventsModel?> getFixtureEvents(int fixtureId) => _getFixtureEventsFromUrl('https://v3.football.api-sports.io/fixtures/events?fixture=$fixtureId');

  Future<EventsModel?> _getFixtureEventsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url), 
      headers: headers);
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var events = body['response'];
      return EventsModel.fromJson(events);
    } else {
      throw ServerException();
    }
  }
}
