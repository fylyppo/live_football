import 'package:flutter/material.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'team.dart';
part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required final Time time,
    required final Team team,
    required final EventPlayer player,
    required final Assist assist,
    required final String type,
    required final String detail,
    required final String? comments,
    required final Widget? icon,
  }) = _Event;
}

@freezed
class EventPlayer with _$EventPlayer {
  const factory EventPlayer({
    required final int id,
    required final String name,
  }) = _EventPlayer;
  factory EventPlayer.fromJson(Map<String, dynamic> json) =>
      _$EventPlayerFromJson(json);
}

@freezed
class Time with _$Time {
  const factory Time({
    required final int elapsed,
    required final int? extra,
  }) = _Time;
  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@freezed
class Assist with _$Assist {
  const factory Assist({
    required final int? id,
    required final String? name,
  }) = _Assist;
  factory Assist.fromJson(Map<String, dynamic> json) => _$AssistFromJson(json);
}
