import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/team.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
abstract class StatsModel implements _$StatsModel {
  StatsModel._();
  factory StatsModel({
    required final Team team,
    required final List<Stat> statistics,
  }) = _StatsModel;
  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  Stats toDomain() {
    return Stats(team: team, statistics: statistics);
  }
}
