import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';

class LiveMatchesModel extends LiveMatches {
  const LiveMatchesModel({required List<Match> matches}) : super(matches: matches);

  factory LiveMatchesModel.fromJson(Map<String, dynamic> json) {
    return LiveMatchesModel(matches: [Match(fixture: Fixture(id: json['fixture']['id'], referee: json['fixture']['referee']))]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : matches[0].fixture.id,
      'referee': matches[0].fixture.referee,
    };
  }
}