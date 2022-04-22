import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'team.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    required final Time time,
    required final Team team,
    required final EventPlayer player,
    required final Assist assist,
    required final String type,
    required final String detail,
    required final String? comments,
  }) = _Event;
}

// factory EventIcon.fromJson(String jsonString) {
//   Map<String, Icon> iconsMap = {
//     'Normal': const Icon(Icons.sports_soccer),
//     'Yellow': const Icon(
//       Icons.crop_portrait,
//       color: Colors.yellow,
//     ),
//     'Red': Icon(
//       Icons.crop_portrait,
//       color: Colors.red[700],
//     ),
//     'Substitution': const Icon(Icons.wifi_protected_setup)
//   };
//   Icon icon = const Icon(Icons.event);
//   iconsMap.forEach((key, value) {
//     if (jsonString.contains(key)) {
//       icon = value;
//     }
//   });
//   return EventIcon(detail: jsonString, icon: icon);
// }

@freezed
class EventPlayer with _$EventPlayer {
  factory EventPlayer({
    required final int id,
    required final String name,
  }) = _EventPlayer;
  factory EventPlayer.fromJson(Map<String, dynamic> json) =>
      _$EventPlayerFromJson(json);
}

@freezed
class Time with _$Time {
  factory Time({
    required final int elapsed,
    required final int? extra,
  }) = _Time;
  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@freezed
class Assist with _$Assist {
  factory Assist({
    required final int? id,
    required final String? name,
  }) = _Assist;
  factory Assist.fromJson(Map<String, dynamic> json) => _$AssistFromJson(json);
}
