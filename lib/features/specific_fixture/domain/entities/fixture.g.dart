// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FixtureData _$$_FixtureDataFromJson(Map<String, dynamic> json) =>
    _$_FixtureData(
      id: json['id'] as int,
      referee: json['referee'] as String?,
      date: json['date'] as String,
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      venue: Venue.fromJson(json['venue'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FixtureDataToJson(_$_FixtureData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referee': instance.referee,
      'date': instance.date,
      'status': instance.status,
      'venue': instance.venue,
    };

_$_Venue _$$_VenueFromJson(Map<String, dynamic> json) => _$_Venue(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$_VenueToJson(_$_Venue instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
    };

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      elapsed: json['elapsed'] as int?,
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'elapsed': instance.elapsed,
    };

_$_League _$$_LeagueFromJson(Map<String, dynamic> json) => _$_League(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      flag: json['flag'] as String?,
      round: json['round'] as String,
    );

Map<String, dynamic> _$$_LeagueToJson(_$_League instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'flag': instance.flag,
      'round': instance.round,
    };

_$_Teams _$$_TeamsFromJson(Map<String, dynamic> json) => _$_Teams(
      home: Team.fromJson(json['home'] as Map<String, dynamic>),
      away: Team.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeamsToJson(_$_Teams instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };

_$_Goals _$$_GoalsFromJson(Map<String, dynamic> json) => _$_Goals(
      home: json['home'] as int?,
      away: json['away'] as int?,
    );

Map<String, dynamic> _$$_GoalsToJson(_$_Goals instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
