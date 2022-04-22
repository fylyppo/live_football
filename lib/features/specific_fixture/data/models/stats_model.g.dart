// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatsModel _$$_StatsModelFromJson(Map<String, dynamic> json) =>
    _$_StatsModel(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatsModelToJson(_$_StatsModel instance) =>
    <String, dynamic>{
      'team': instance.team,
      'statistics': instance.statistics,
    };
