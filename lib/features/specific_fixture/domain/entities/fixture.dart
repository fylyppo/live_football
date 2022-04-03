import 'package:equatable/equatable.dart';

import 'team.dart';

class Fixture extends Equatable {
  final FixtureData fixtureData;
  final League league;
  final Teams teams;
  final Goals goals;

  const Fixture({required this.league, required this.teams, required this.goals, required this.fixtureData});

  @override
  List<Object?> get props => [league, teams, goals,fixtureData];
}

class FixtureData extends Equatable {
  final int id;
  final String? referee;
  final String date;
  final Status status;
  final Venue venue;

  const FixtureData({
    required this.id,
    this.referee,
    required this.date,
    required this.status,
    required this.venue,
  });

  @override
  List<Object?> get props => [id, referee];
}

class Venue extends Equatable {
  final int? id;
  final String name;
  final String city;
  
  const Venue({
    required this.id,
    required this.name,
    required this.city,
  });

  @override
  List<Object?> get props => [id, name, city];
}

class Status extends Equatable {
  final int elapsed;

  const Status({required this.elapsed});

  @override
  List<Object?> get props => [elapsed];
}

class League extends Equatable {
  final int id;
  final String name;
  final String logo;
  final String? flag;
  final String round;

  const League({required this.id, required this.name, required this.logo, required this.flag, required this.round});

  @override
  List<Object?> get props => [id, name, logo, flag, round];
}

class Teams extends Equatable {
  final Team home;
  final Team away;

  const Teams({required this.home, required this.away});

  @override
  List<Object?> get props => [home, away];

}

class Goals extends Equatable {
  final int home;
  final int away;

  const Goals({required this.home, required this.away});

  @override
  List<Object?> get props => [home, away];
}