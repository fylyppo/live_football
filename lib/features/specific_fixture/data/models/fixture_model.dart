import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';

import '../../domain/entities/team.dart';

class FixtureModel extends Fixture {
  const FixtureModel({required FixtureData fixtureData, required Goals goals, required League league, required Teams teams})
      : super(fixtureData: fixtureData, goals: goals, league: league, teams: teams);

  factory FixtureModel.fromJson(List<dynamic> jsonList) {
    Map<String, dynamic> json = jsonList[0];
    return FixtureModel(
        fixtureData: FixtureData(
          id: json['fixture']['id'],
          referee: json['fixture']['referee'],
          date: json['fixture']['date'],
          status: Status(elapsed: json['fixture']['status']['elapsed']),
          venue: Venue(id: json['fixture']['venue']['id'], name: json['fixture']['venue']['name'], city: json['fixture']['venue']['city'])
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': fixtureData.id,
      'referee': fixtureData.referee,
    };
  }
}
