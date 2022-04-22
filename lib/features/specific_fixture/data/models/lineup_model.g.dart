// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineupModel _$$_LineupModelFromJson(Map<String, dynamic> json) =>
    _$_LineupModel(
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      formation: json['formation'] as String,
      startXI: (json['startXI'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      substitutes: (json['substitutes'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      coach: Coach.fromJson(json['coach'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LineupModelToJson(_$_LineupModel instance) =>
    <String, dynamic>{
      'team': instance.team,
      'formation': instance.formation,
      'startXI': instance.startXI,
      'substitutes': instance.substitutes,
      'coach': instance.coach,
    };
