import 'package:equatable/equatable.dart';

class LiveMatches extends Equatable {
  final List<Match> matches;

  const LiveMatches({required this.matches});

  @override
  List<Object?> get props => [matches];
}

class Match extends Equatable {
  final Fixture fixture;
  final League league;
  final Teams teams;
  final Goals goals;

  const Match({required this.league, required this.teams, required this.goals, required this.fixture});

  @override
  List<Object?> get props => [fixture];
}

class Fixture extends Equatable {
  final int id;
  final String? referee;
  final String date;
  final Status status;

  const Fixture({
    required this.id,
    this.referee,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props => [id, referee];
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

class Team extends Equatable {
  final int id;
  final String name;
  final String logo;

  const Team({required this.id, required this.name, required this.logo});

  @override
  List<Object?> get props => [id, name, logo];
}

class Goals extends Equatable {
  final int home;
  final int away;

  const Goals({required this.home, required this.away});

  @override
  List<Object?> get props => [home, away];
}