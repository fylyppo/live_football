import 'package:flutter/material.dart';
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
        icon: null);
  }

  Event toDomainWithIcon() {
    Map<String, Icon> iconsMap = {
      'Normal': const Icon(Icons.sports_soccer),
      'Yellow': const Icon(
        Icons.crop_portrait,
        color: Colors.yellow,
      ),
      'Red': Icon(
        Icons.crop_portrait,
        color: Colors.red[700],
      ),
      'Substitution': const Icon(Icons.wifi_protected_setup)
    };
    Icon icon = const Icon(Icons.event);
    iconsMap.forEach((key, value) {
      if (detail.contains(key)) {
        icon = value;
      }
    });
    return Event(
      time: time,
      team: team,
      player: player,
      assist: assist,
      type: type,
      detail: detail,
      comments: comments,
      icon: icon,
    );
  }
}
