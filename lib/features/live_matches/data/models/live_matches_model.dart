import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';

import '../../domain/entities/team.dart';

class LiveMatchesModel extends LiveMatches {
  const LiveMatchesModel({required List<Match> matches})
      : super(matches: matches);

  factory LiveMatchesModel.fromJson(Map<String, dynamic> json) {
    return LiveMatchesModel(matches: [
      Match(
        fixture: Fixture(
          id: json['fixture']['id'],
          referee: json['fixture']['referee'],
          date: json['fixture']['date'],
          status: Status(elapsed: json['fixture']['status']['elapsed']),
        ),
        goals: Goals(home: json['goals']['home'], away: json['goals']['away']),
        league: League(
            id: json['league']['id'],
            name: json['league']['name'],
            logo: json['league']['logo'],
            flag: json['league']['flag'],
            round: json['league']['round']),
        teams: Teams(
            home: Team(
                id: json['teams']['home']['id'],
                name: json['teams']['home']['name'],
                logo: json['teams']['home']['logo']),
            away: Team(
                id: json['teams']['away']['id'],
                name: json['teams']['away']['name'],
                logo: json['teams']['away']['logo'])),
      )
    ]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': matches[0].fixture.id,
      'referee': matches[0].fixture.referee,
    };
  }
}
