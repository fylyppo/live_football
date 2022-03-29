import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tFixtureModel = FixtureModel(
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
          fixtureData: FixtureData(id: 1, referee: 'Piputkin', date: '2020-02-06T14:00:00+00:00', status: Status(elapsed: 23)));

  test('should be a subclass of Fixture entity',
   () async {
     //assert
     expect(tFixtureModel, isA<Fixture>());
   }
   );

   group('fromJson', () {
     test('should return a valid model', () async {
       //arrange
       final Map<String, dynamic> jsonMap = json.decode(fixture('fixture.json'));
       final List<dynamic> match = jsonMap['response'];
       //act
       final result = FixtureModel.fromJson(match);
       //expect
       expect(result, tFixtureModel);
     });

   });

   group('toJson', () {
     test('should return a JSON map containing the proper data', () async {
       //act
       final result = tFixtureModel.toJson();
       //expect
       final expectedMap = {
         "id": 1,
         "referee": "Piputkin",
       };
       expect(result, expectedMap);
     });

   });
}