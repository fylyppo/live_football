import '../../domain/entities/events.dart';

class EventsModel extends Events{
  const EventsModel({required List<Event> events}) : super(events: events);

  factory EventsModel.fromJson(List<dynamic> jsonList) {
    List<Event> events = jsonList.map((e) => Event.fromJson(e),).toList();
    return EventsModel(events: events);
  }
}