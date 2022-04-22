// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventPlayer _$$_EventPlayerFromJson(Map<String, dynamic> json) =>
    _$_EventPlayer(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_EventPlayerToJson(_$_EventPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      elapsed: json['elapsed'] as int,
      extra: json['extra'] as int?,
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      'elapsed': instance.elapsed,
      'extra': instance.extra,
    };

_$_Assist _$$_AssistFromJson(Map<String, dynamic> json) => _$_Assist(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_AssistToJson(_$_Assist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
