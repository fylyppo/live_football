// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required Time time,
      required Team team,
      required EventPlayer player,
      required Assist assist,
      required String type,
      required String detail,
      required String? comments,
      required Widget? icon}) {
    return _Event(
      time: time,
      team: team,
      player: player,
      assist: assist,
      type: type,
      detail: detail,
      comments: comments,
      icon: icon,
    );
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  Time get time => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;
  EventPlayer get player => throw _privateConstructorUsedError;
  Assist get assist => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  Widget? get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {Time time,
      Team team,
      EventPlayer player,
      Assist assist,
      String type,
      String detail,
      String? comments,
      Widget? icon});

  $TimeCopyWith<$Res> get time;
  $TeamCopyWith<$Res> get team;
  $EventPlayerCopyWith<$Res> get player;
  $AssistCopyWith<$Res> get assist;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? team = freezed,
    Object? player = freezed,
    Object? assist = freezed,
    Object? type = freezed,
    Object? detail = freezed,
    Object? comments = freezed,
    Object? icon = freezed,
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
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
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
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {Time time,
      Team team,
      EventPlayer player,
      Assist assist,
      String type,
      String detail,
      String? comments,
      Widget? icon});

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
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? time = freezed,
    Object? team = freezed,
    Object? player = freezed,
    Object? assist = freezed,
    Object? type = freezed,
    Object? detail = freezed,
    Object? comments = freezed,
    Object? icon = freezed,
  }) {
    return _then(_Event(
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
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

class _$_Event implements _Event {
  const _$_Event(
      {required this.time,
      required this.team,
      required this.player,
      required this.assist,
      required this.type,
      required this.detail,
      required this.comments,
      required this.icon});

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
  final Widget? icon;

  @override
  String toString() {
    return 'Event(time: $time, team: $team, player: $player, assist: $assist, type: $type, detail: $detail, comments: $comments, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.assist, assist) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.detail, detail) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.icon, icon));
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
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {required Time time,
      required Team team,
      required EventPlayer player,
      required Assist assist,
      required String type,
      required String detail,
      required String? comments,
      required Widget? icon}) = _$_Event;

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
  Widget? get icon;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}

EventPlayer _$EventPlayerFromJson(Map<String, dynamic> json) {
  return _EventPlayer.fromJson(json);
}

/// @nodoc
class _$EventPlayerTearOff {
  const _$EventPlayerTearOff();

  _EventPlayer call({required int id, required String name}) {
    return _EventPlayer(
      id: id,
      name: name,
    );
  }

  EventPlayer fromJson(Map<String, Object?> json) {
    return EventPlayer.fromJson(json);
  }
}

/// @nodoc
const $EventPlayer = _$EventPlayerTearOff();

/// @nodoc
mixin _$EventPlayer {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventPlayerCopyWith<EventPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPlayerCopyWith<$Res> {
  factory $EventPlayerCopyWith(
          EventPlayer value, $Res Function(EventPlayer) then) =
      _$EventPlayerCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$EventPlayerCopyWithImpl<$Res> implements $EventPlayerCopyWith<$Res> {
  _$EventPlayerCopyWithImpl(this._value, this._then);

  final EventPlayer _value;
  // ignore: unused_field
  final $Res Function(EventPlayer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$EventPlayerCopyWith<$Res>
    implements $EventPlayerCopyWith<$Res> {
  factory _$EventPlayerCopyWith(
          _EventPlayer value, $Res Function(_EventPlayer) then) =
      __$EventPlayerCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$EventPlayerCopyWithImpl<$Res> extends _$EventPlayerCopyWithImpl<$Res>
    implements _$EventPlayerCopyWith<$Res> {
  __$EventPlayerCopyWithImpl(
      _EventPlayer _value, $Res Function(_EventPlayer) _then)
      : super(_value, (v) => _then(v as _EventPlayer));

  @override
  _EventPlayer get _value => super._value as _EventPlayer;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_EventPlayer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EventPlayer implements _EventPlayer {
  const _$_EventPlayer({required this.id, required this.name});

  factory _$_EventPlayer.fromJson(Map<String, dynamic> json) =>
      _$$_EventPlayerFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'EventPlayer(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventPlayer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$EventPlayerCopyWith<_EventPlayer> get copyWith =>
      __$EventPlayerCopyWithImpl<_EventPlayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventPlayerToJson(this);
  }
}

abstract class _EventPlayer implements EventPlayer {
  const factory _EventPlayer({required int id, required String name}) =
      _$_EventPlayer;

  factory _EventPlayer.fromJson(Map<String, dynamic> json) =
      _$_EventPlayer.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$EventPlayerCopyWith<_EventPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

Time _$TimeFromJson(Map<String, dynamic> json) {
  return _Time.fromJson(json);
}

/// @nodoc
class _$TimeTearOff {
  const _$TimeTearOff();

  _Time call({required int elapsed, required int? extra}) {
    return _Time(
      elapsed: elapsed,
      extra: extra,
    );
  }

  Time fromJson(Map<String, Object?> json) {
    return Time.fromJson(json);
  }
}

/// @nodoc
const $Time = _$TimeTearOff();

/// @nodoc
mixin _$Time {
  int get elapsed => throw _privateConstructorUsedError;
  int? get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeCopyWith<Time> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeCopyWith<$Res> {
  factory $TimeCopyWith(Time value, $Res Function(Time) then) =
      _$TimeCopyWithImpl<$Res>;
  $Res call({int elapsed, int? extra});
}

/// @nodoc
class _$TimeCopyWithImpl<$Res> implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._value, this._then);

  final Time _value;
  // ignore: unused_field
  final $Res Function(Time) _then;

  @override
  $Res call({
    Object? elapsed = freezed,
    Object? extra = freezed,
  }) {
    return _then(_value.copyWith(
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int,
      extra: extra == freezed
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$TimeCopyWith(_Time value, $Res Function(_Time) then) =
      __$TimeCopyWithImpl<$Res>;
  @override
  $Res call({int elapsed, int? extra});
}

/// @nodoc
class __$TimeCopyWithImpl<$Res> extends _$TimeCopyWithImpl<$Res>
    implements _$TimeCopyWith<$Res> {
  __$TimeCopyWithImpl(_Time _value, $Res Function(_Time) _then)
      : super(_value, (v) => _then(v as _Time));

  @override
  _Time get _value => super._value as _Time;

  @override
  $Res call({
    Object? elapsed = freezed,
    Object? extra = freezed,
  }) {
    return _then(_Time(
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int,
      extra: extra == freezed
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Time implements _Time {
  const _$_Time({required this.elapsed, required this.extra});

  factory _$_Time.fromJson(Map<String, dynamic> json) => _$$_TimeFromJson(json);

  @override
  final int elapsed;
  @override
  final int? extra;

  @override
  String toString() {
    return 'Time(elapsed: $elapsed, extra: $extra)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Time &&
            const DeepCollectionEquality().equals(other.elapsed, elapsed) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(elapsed),
      const DeepCollectionEquality().hash(extra));

  @JsonKey(ignore: true)
  @override
  _$TimeCopyWith<_Time> get copyWith =>
      __$TimeCopyWithImpl<_Time>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeToJson(this);
  }
}

abstract class _Time implements Time {
  const factory _Time({required int elapsed, required int? extra}) = _$_Time;

  factory _Time.fromJson(Map<String, dynamic> json) = _$_Time.fromJson;

  @override
  int get elapsed;
  @override
  int? get extra;
  @override
  @JsonKey(ignore: true)
  _$TimeCopyWith<_Time> get copyWith => throw _privateConstructorUsedError;
}

Assist _$AssistFromJson(Map<String, dynamic> json) {
  return _Assist.fromJson(json);
}

/// @nodoc
class _$AssistTearOff {
  const _$AssistTearOff();

  _Assist call({required int? id, required String? name}) {
    return _Assist(
      id: id,
      name: name,
    );
  }

  Assist fromJson(Map<String, Object?> json) {
    return Assist.fromJson(json);
  }
}

/// @nodoc
const $Assist = _$AssistTearOff();

/// @nodoc
mixin _$Assist {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssistCopyWith<Assist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistCopyWith<$Res> {
  factory $AssistCopyWith(Assist value, $Res Function(Assist) then) =
      _$AssistCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$AssistCopyWithImpl<$Res> implements $AssistCopyWith<$Res> {
  _$AssistCopyWithImpl(this._value, this._then);

  final Assist _value;
  // ignore: unused_field
  final $Res Function(Assist) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AssistCopyWith<$Res> implements $AssistCopyWith<$Res> {
  factory _$AssistCopyWith(_Assist value, $Res Function(_Assist) then) =
      __$AssistCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$AssistCopyWithImpl<$Res> extends _$AssistCopyWithImpl<$Res>
    implements _$AssistCopyWith<$Res> {
  __$AssistCopyWithImpl(_Assist _value, $Res Function(_Assist) _then)
      : super(_value, (v) => _then(v as _Assist));

  @override
  _Assist get _value => super._value as _Assist;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Assist(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assist implements _Assist {
  const _$_Assist({required this.id, required this.name});

  factory _$_Assist.fromJson(Map<String, dynamic> json) =>
      _$$_AssistFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Assist(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Assist &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$AssistCopyWith<_Assist> get copyWith =>
      __$AssistCopyWithImpl<_Assist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssistToJson(this);
  }
}

abstract class _Assist implements Assist {
  const factory _Assist({required int? id, required String? name}) = _$_Assist;

  factory _Assist.fromJson(Map<String, dynamic> json) = _$_Assist.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$AssistCopyWith<_Assist> get copyWith => throw _privateConstructorUsedError;
}
