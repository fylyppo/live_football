import 'package:dio/dio.dart';
import '../../../../../core/datasources/remote/api_football_client.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/event_model.dart';

abstract class FixtureEventsRemoteDataSource {
  Future<List<EventModel>> getFixtureEvents(int fixtureId);
}

class FixtureEventsRemoteDataSourceImpl implements FixtureEventsRemoteDataSource {
  final Dio dio;
  final ApiFootballClient client;

  FixtureEventsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });

  @override
  Future<List<EventModel>> getFixtureEvents(int id) async {
    final httpResponse = await client.getEvents(id);
    if(httpResponse.response.statusCode == 200){
      List<dynamic> body = httpResponse.response.data['response'];
      List<EventModel> eventModelsList =
          body.map((e) => EventModel.fromJson(e)).toList();
      return eventModelsList;
    } else {
      throw ServerException();
    }
  }
}
