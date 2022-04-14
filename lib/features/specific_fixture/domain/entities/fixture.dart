import 'package:freezed_annotation/freezed_annotation.dart';
import 'team.dart';

part 'fixture.freezed.dart';
part 'fixture.g.dart';

@freezed
class Fixture with _$Fixture {
  factory Fixture({required final FixtureData fixture, required final League league, required final Teams teams, required final Goals goals,}) = _Fixture;
}

@freezed
class FixtureData with _$FixtureData {
  factory FixtureData({required final int id, required final String? referee, required final String date, required final Status status, required final Venue venue,}) = _FixtureData;
  factory FixtureData.fromJson(Map<String, dynamic> json) => _$FixtureDataFromJson(json);
}

@freezed
class Venue with _$Venue {
  factory Venue({required final int? id, required final String? name, required final String? city}) = _Venue;
  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

@freezed
class Status with _$Status {
  factory Status({required final int? elapsed,}) = _Status;
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}

@freezed
class League with _$League {
  factory League({required final int id, required final String name, required final String logo, required final String? flag, required final String round,}) = _League;
  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}

@freezed
class Teams with _$Teams {
  factory Teams({required final Team home, required final Team away}) = _Teams;
  factory Teams.fromJson(Map<String, dynamic> json) => _$TeamsFromJson(json);
}

@freezed
class Goals with _$Goals {
  factory Goals({required final int? home, required final int? away}) = _Goals;
  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);
}