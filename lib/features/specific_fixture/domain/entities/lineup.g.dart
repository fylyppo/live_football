// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lineup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as int,
      name: json['name'] as String,
      number: json['number'] as int?,
      pos: json['pos'] as String?,
      grid: json['grid'] as String?,
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'pos': instance.pos,
      'grid': instance.grid,
    };

_$_Coach _$$_CoachFromJson(Map<String, dynamic> json) => _$_Coach(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$_CoachToJson(_$_Coach instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
    };
