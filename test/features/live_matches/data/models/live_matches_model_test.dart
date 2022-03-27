import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/entities/team.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLiveMatchesModel = LiveMatchesModel(matches: [Match(
          league: League(
              id: 850,
              name: 'UEFA U21 Championship - Qualification',
              logo: 'https://media.api-sports.io/football/leagues/850.png',
              flag: null,
              round: 'Ranking of second-placed teams - 17'),
          teams: Teams(
              home: Team(id: 8200, name: 'Israel U21', logo: 'https://media.api-sports.io/football/teams/8200.png'),
              away: Team(id: 8215, name: 'Poland U21', logo: 'https://media.api-sports.io/football/teams/8215.png')),
          goals: Goals(home: 0, away: 1),
          fixture: Fixture(id: 1, referee: 'Piputkin', date: '2020-02-06T14:00:00+00:00', status: Status(elapsed: 23)))]);

  test('should be a subclass of LiveMatches entity',
   () async {
     //assert
     expect(tLiveMatchesModel, isA<LiveMatches>());
   }
   );

   group('fromJson', () {
     test('should return a valid model', () async {
       //arrange
       final Map<String, dynamic> jsonMap = json.decode(fixture('live_matches.json'));
       final List<dynamic> matchesList = jsonMap['response'];
       final  Map<String, dynamic> match = matchesList[0];
       //act
       final result = LiveMatchesModel.fromJson(match);
       //expect
       expect(result, tLiveMatchesModel);
     });

   });

   group('toJson', () {
     test('should return a JSON map containing the proper data', () async {
       //act
       final result = tLiveMatchesModel.toJson();
       //expect
       final expectedMap = {
         "id": 1,
         "referee": "Piputkin",
       };
       expect(result, expectedMap);
     });

   });
}