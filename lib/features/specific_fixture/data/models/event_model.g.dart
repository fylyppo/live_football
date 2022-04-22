// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      player: EventPlayer.fromJson(json['player'] as Map<String, dynamic>),
      assist: Assist.fromJson(json['assist'] as Map<String, dynamic>),
      type: json['type'] as String,
      detail: json['detail'] as String,
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'team': instance.team,
      'player': instance.player,
      'assist': instance.assist,
      'type': instance.type,
      'detail': instance.detail,
      'comments': instance.comments,
    };
