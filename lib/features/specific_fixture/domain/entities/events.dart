import 'package:equatable/equatable.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';

class Events extends Equatable {
  final List<Event> events;
  
  const Events({
    required this.events,
  });

  factory Events.fromJson(List<dynamic> jsonList) {
    List<Event> events = jsonList.map((e) => Event.fromJson(e),).toList();
    return Events(events: events);
  }

  @override
  List<Object?> get props => [events];
}

class Event extends Equatable {
  final Time time;
  final Team team;
  final Player player;
  final Assist assist;
  final String type;
  final String detail;
  final String? comments;

  const Event({
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type,
    required this.detail,
    this.comments,
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(time: Time.fromJson(json['time']), team: Team.fromJson(json['team']), player: Player.fromJson(json['player']), assist: Assist.fromJson(json['assist']), type: json['type'], detail: json['detail'], comments: json['comments']);
  }
  
  @override
  List<Object?> get props => [time, team, player, assist, type, detail, comments];
}

class Time extends Equatable {
  final int elapsed;
  final int? extra;
  
  const Time({
    required this.elapsed,
    this.extra,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(elapsed: json['elapsed'], extra: json['extra']);
  }

  @override
  List<Object?> get props => [elapsed, extra];
}

class Assist extends Equatable {
  final int? id;
  final String? name;
  
  const Assist({
    required this.id,
    required this.name,
  });
  
  factory Assist.fromJson(Map<String, dynamic> json) {
    return Assist(id: json['id'], name: json['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
