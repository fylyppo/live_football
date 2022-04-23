import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'team.dart';

part 'stats.freezed.dart';
part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  factory Stats({
    required final Team team,
    required final List<Stat> statistics,
  }) = _Stats;
}

@freezed
class Stat with _$Stat {
  factory Stat({
    required final String type,
    @JsonKey(defaultValue: 0) required final dynamic value,
  }) = _Stat;
  factory Stat.fromJson(Map<String, dynamic> json) =>
      _$StatFromJson(json);
}