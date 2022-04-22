import '../../domain/entities/event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/team.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
abstract class EventModel implements _$EventModel {
  EventModel._();
  factory EventModel({
    required final Time time,
    required final Team team,
    required final EventPlayer player,
    required final Assist assist,
    required final String type,
    required final String detail,
    required final String? comments,
  }) = _EventModel;
  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Event toDomain() {
    return Event(
      time: time,
      team: team,
      player: player,
      assist: assist,
      type: type,
      detail: detail,
      comments: comments,
    );
  }
}
