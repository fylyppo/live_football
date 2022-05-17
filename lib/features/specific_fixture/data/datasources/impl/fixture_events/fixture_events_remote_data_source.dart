import 'package:dio/dio.dart';
import '../../../../../../core/datasources/remote/api_football_client.dart';
import '../../../../../../core/error/exceptions.dart';
import '../../../models/event_model.dart';
import '../../fixture_component_remote_data_source.dart';

class FixtureEventsRemoteDataSourceImpl implements FixtureComponentRemoteDataSource<List<EventModel>> {
  final Dio dio;
  final ApiFootballClient client;

  FixtureEventsRemoteDataSourceImpl({
    required this.dio,
    required this.client,
  });

  @override
  Future<List<EventModel>> getFixtureComponent(int id) async {
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
