import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLiveMatchesModel = LiveMatchesModel(matches: [Match(fixture: Fixture(id: 1, referee: 'Piputkin'))]);

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
       //act
       final result = LiveMatchesModel.fromJson(jsonMap);
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