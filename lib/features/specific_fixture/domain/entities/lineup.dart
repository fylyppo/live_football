import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lineup.freezed.dart';
part 'lineup.g.dart';

@freezed
class Lineup with _$Lineup {
  factory Lineup({
    required final Team team,
    required final String formation,
    required final List<Player> startXI,
    required final List<Player> substitutes,
    required final Coach coach,
  }) = _Lineup;
}

@freezed
class Player with _$Player {
  factory Player({
    required final int id,
    required final String name,
    required final int? number,
    required final String? pos,
    required final String? grid,
  }) = _Player;
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json['player']);
}

@freezed
class Coach with _$Coach {
  factory Coach({
    required final int id,
    required final String name,
    required final String? photo,
  }) = _Coach;
  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);
}
