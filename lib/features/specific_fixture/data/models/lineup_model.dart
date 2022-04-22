import '../../domain/entities/lineup.dart';
import '../../domain/entities/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lineup_model.freezed.dart';
part 'lineup_model.g.dart';

@freezed
abstract class LineupModel implements _$LineupModel {
  LineupModel._();
  factory LineupModel({
    required final Team team,
    required final String formation,
    required final List<Player> startXI,
    required final List<Player> substitutes,
    required final Coach coach,
  }) = _LineupModel;
  factory LineupModel.fromJson(Map<String, dynamic> json) =>
      _$LineupModelFromJson(json);

  Lineup toDomain() {
    return Lineup(team: team, formation: formation, startXI: startXI, substitutes: substitutes, coach: coach);
  }
}