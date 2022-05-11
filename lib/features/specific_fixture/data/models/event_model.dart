import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/team.dart';
part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
abstract class EventModel implements _$EventModel {
  const EventModel._();
  const factory EventModel({
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

  Event toDomainWithIcon() {
    Map<String, Widget> iconsMap = {
      'Normal': const Icon(Icons.sports_soccer),
      'Own Goal': Icon(Icons.sports_soccer, color: Colors.red[700],),
      'Yellow': const Icon(
        Icons.crop_portrait,
        color: Colors.yellow,
      ),
      'Red': Icon(
        Icons.crop_portrait,
        color: Colors.red[700],
      ),
      'Substitution': const Icon(Icons.wifi_protected_setup),
      'Penalty': SizedBox(
        height: 25,
        width: 25,
        child: Stack(
          children: const [
            Icon(
              Icons.sports_soccer,
              size: 25,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'P',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(1, 1)),
                      Shadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
              ),
            )
          ],
        ),
      ),
      'Penalty awarded': SizedBox(
        height: 25,
        width: 25,
        child: Stack(
          children: const [
            Icon(
              Icons.sports,
              size: 25,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'P',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(1, 1)),
                      Shadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
              ),
            )
          ],
        ),
      ),
    };
    Widget icon = const Icon(Icons.event);
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
