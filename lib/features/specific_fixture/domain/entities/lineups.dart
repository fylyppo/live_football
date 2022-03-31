import 'package:equatable/equatable.dart';

import 'package:live_football/features/specific_fixture/domain/entities/team.dart';

class Lineups extends Equatable {
  final Lineup homeLineup;
  final Lineup awayLineup;
  
  const Lineups({
    required this.homeLineup,
    required this.awayLineup,
  });

  factory Lineups.fromJson(List<dynamic> json) {
    return Lineups(homeLineup: Lineup.fromJson(json[0]), awayLineup: Lineup.fromJson(json[1]));
  }
  
  @override
  List<Object?> get props => [homeLineup, awayLineup];
}

class Lineup extends Equatable {
  final Team team;
  final String formation;
  final Players startXI;
  final Players substitutes;
  final Coach coach;
  
  const Lineup({
    required this.team,
    required this.formation,
    required this.startXI,
    required this.substitutes,
    required this.coach,
  });

  factory Lineup.fromJson(Map<String, dynamic> json) {
    return Lineup(team: Team.fromJson(json['team']), formation: json['formation'], startXI: Players.fromJson(json['startXI']), substitutes: Players.fromJson(json['substitutes']), coach: Coach.fromJson(json['coach']));
  }

  @override
  List<Object?> get props => [team, formation, Players, substitutes, coach];
}

class Players extends Equatable {
  final List<Player> playersList;
  
  const Players({
    required this.playersList,
  });

  factory Players.fromJson(List<dynamic> json) {
    List<Player> playersList = json.map((e) => Player.fromJson(e['player']),).toList();
    return Players(playersList: playersList);
  }
  
  @override
  List<Object?> get props => [playersList];
}

class Player extends Equatable {
  final int id;
  final String name;
  final int? number;
  final String? pos;
  final String? grid;
  
  const Player({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
    required this.grid,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(id: json['id'], name: json['name'], number: json['number'], pos: json['pos'], grid: json['grid']);
  }

  @override
  List<Object?> get props => [id, name, number, pos, grid];
}

class Coach extends Equatable {
  final int id;
  final String name;
  final String photo;
  
  const Coach({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(id: json['id'], name: json['name'], photo: json['photo']);
  }

  @override
  List<Object?> get props => [id, name, photo];
}
