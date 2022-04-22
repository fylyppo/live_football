// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventModel _$EventModelFromJson(Map<String, dynamic> json) {
  return _EventModel.fromJson(json);
}

/// @nodoc
class _$EventModelTearOff {
  const _$EventModelTearOff();

  _EventModel call(
      {required Time time,
      required Team team,
      required EventPlayer player,
      required Assist assist,
      required String type,
      required String detail,
      required String? comments}) {
    return _EventModel(
      time: time,
      team: team,
      player: player,
      assist: assist,
      type: type,
      detail: detail,
      comments: comments,
    );
  }

  EventModel fromJson(Map<String, Object?> json) {
    return EventModel.fromJson(json);
  }
}

/// @nodoc
const $EventModel = _$EventModelTearOff();

/// @nodoc
mixin _$EventModel {
  Time get time => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  EventPlayer get player => throw _privateConstructorUsedError;
  Assist get assist => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventModelCopyWith<EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventModelCopyWith<$Res> {
  factory $EventModelCopyWith(
          EventModel value, $Res Function(EventModel) then) =
      _$EventModelCopyWithImpl<$Res>;
  $Res call(
      {Time time,
      Team team,
      EventPlayer player,
      Assist assist,
      String type,
      String detail,
      String? comments});

  $TimeCopyWith<$Res> get time;
  $TeamCopyWith<$Res> get team;
  $EventPlayerCopyWith<$Res> get player;
  $AssistCopyWith<$Res> get assist;
}

/// @nodoc
class _$EventModelCopyWithImpl<$Res> implements $EventModelCopyWith<$Res> {
  _$EventModelCopyWithImpl(this._value, this._then);

  final EventModel _value;
  // ignore: unused_field
  final $Res Function(EventModel) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? team = freezed,
    Object? player = freezed,
    Object? assist = freezed,
    Object? type = freezed,
    Object? detail = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as EventPlayer,
      assist: assist == freezed
          ? _value.assist
          : assist // ignore: cast_nullable_to_non_nullable
              as Assist,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $TimeCopyWith<$Res> get time {
    return $TimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value));
    });
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }

  @override
  $EventPlayerCopyWith<$Res> get player {
    return $EventPlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value));
    });
  }

  @override
  $AssistCopyWith<$Res> get assist {
    return $AssistCopyWith<$Res>(_value.assist, (value) {
      return _then(_value.copyWith(assist: value));
    });
  }
}

/// @nodoc
abstract class _$EventModelCopyWith<$Res> implements $EventModelCopyWith<$Res> {
  factory _$EventModelCopyWith(
          _EventModel value, $Res Function(_EventModel) then) =
      __$EventModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {Time time,
      Team team,
      EventPlayer player,
      Assist assist,
      String type,
      String detail,
      String? comments});

  @override
  $TimeCopyWith<$Res> get time;
  @override
  $TeamCopyWith<$Res> get team;
  @override
  $EventPlayerCopyWith<$Res> get player;
  @override
  $AssistCopyWith<$Res> get assist;
}

/// @nodoc
class __$EventModelCopyWithImpl<$Res> extends _$EventModelCopyWithImpl<$Res>
    implements _$EventModelCopyWith<$Res> {
  __$EventModelCopyWithImpl(
      _EventModel _value, $Res Function(_EventModel) _then)
      : super(_value, (v) => _then(v as _EventModel));

  @override
  _EventModel get _value => super._value as _EventModel;

  @override
  $Res call({
    Object? time = freezed,
    Object? team = freezed,
    Object? player = freezed,
    Object? assist = freezed,
    Object? type = freezed,
    Object? detail = freezed,
    Object? comments = freezed,
  }) {
    return _then(_EventModel(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as EventPlayer,
      assist: assist == freezed
          ? _value.assist
          : assist // ignore: cast_nullable_to_non_nullable
              as Assist,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventModel extends _EventModel {
  _$_EventModel(
      {required this.time,
      required this.team,
      required this.player,
      required this.assist,
      required this.type,
      required this.detail,
      required this.comments})
      : super._();

  factory _$_EventModel.fromJson(Map<String, dynamic> json) =>
      _$$_EventModelFromJson(json);

  @override
  final Time time;
  @override
  final Team team;
  @override
  final EventPlayer player;
  @override
  final Assist assist;
  @override
  final String type;
  @override
  final String detail;
  @override
  final String? comments;

  @override
  String toString() {
    return 'EventModel(time: $time, team: $team, player: $player, assist: $assist, type: $type, detail: $detail, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventModel &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.assist, assist) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.detail, detail) &&
            const DeepCollectionEquality().equals(other.comments, comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(assist),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(detail),
      const DeepCollectionEquality().hash(comments));

  @JsonKey(ignore: true)
  @override
  _$EventModelCopyWith<_EventModel> get copyWith =>
      __$EventModelCopyWithImpl<_EventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventModelToJson(this);
  }
}

abstract class _EventModel extends EventModel {
  factory _EventModel(
      {required Time time,
      required Team team,
      required EventPlayer player,
      required Assist assist,
      required String type,
      required String detail,
      required String? comments}) = _$_EventModel;
  _EventModel._() : super._();

  factory _EventModel.fromJson(Map<String, dynamic> json) =
      _$_EventModel.fromJson;

  @override
  Time get time;
  @override
  Team get team;
  @override
  EventPlayer get player;
  @override
  Assist get assist;
  @override
  String get type;
  @override
  String get detail;
  @override
  String? get comments;
  @override
  @JsonKey(ignore: true)
  _$EventModelCopyWith<_EventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
