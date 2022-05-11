import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_model.freezed.dart';
part 'fixture_model.g.dart';

@freezed
abstract class FixtureModel implements _$FixtureModel {
  const FixtureModel._();
  const factory FixtureModel({
    required final FixtureData fixture,
    required final League league,
    required final Teams teams,
    required final Goals goals,
  }) = _FixtureModel;
  factory FixtureModel.fromJson(Map<String, dynamic> json) =>
      _$FixtureModelFromJson(json);

  Fixture toDomain() {
    return Fixture(
        fixture: fixture, league: league, teams: teams, goals: goals);
  }
}
