// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lineup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LineupTearOff {
  const _$LineupTearOff();

  _Lineup call(
      {required Team team,
      required String formation,
      required List<Player> startXI,
      required List<Player> substitutes,
      required Coach coach}) {
    return _Lineup(
      team: team,
      formation: formation,
      startXI: startXI,
      substitutes: substitutes,
      coach: coach,
    );
  }
}

/// @nodoc
const $Lineup = _$LineupTearOff();

/// @nodoc
mixin _$Lineup {
  Team get team => throw _privateConstructorUsedError;
  String get formation => throw _privateConstructorUsedError;
  List<Player> get startXI => throw _privateConstructorUsedError;
  List<Player> get substitutes => throw _privateConstructorUsedError;
  Coach get coach => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LineupCopyWith<Lineup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineupCopyWith<$Res> {
  factory $LineupCopyWith(Lineup value, $Res Function(Lineup) then) =
      _$LineupCopyWithImpl<$Res>;
  $Res call(
      {Team team,
      String formation,
      List<Player> startXI,
      List<Player> substitutes,
      Coach coach});

  $TeamCopyWith<$Res> get team;
  $CoachCopyWith<$Res> get coach;
}

/// @nodoc
class _$LineupCopyWithImpl<$Res> implements $LineupCopyWith<$Res> {
  _$LineupCopyWithImpl(this._value, this._then);

  final Lineup _value;
  // ignore: unused_field
  final $Res Function(Lineup) _then;

  @override
  $Res call({
    Object? team = freezed,
    Object? formation = freezed,
    Object? startXI = freezed,
    Object? substitutes = freezed,
    Object? coach = freezed,
  }) {
    return _then(_value.copyWith(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      formation: formation == freezed
          ? _value.formation
          : formation // ignore: cast_nullable_to_non_nullable
              as String,
      startXI: startXI == freezed
          ? _value.startXI
          : startXI // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      substitutes: substitutes == freezed
          ? _value.substitutes
          : substitutes // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      coach: coach == freezed
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as Coach,
    ));
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }

  @override
  $CoachCopyWith<$Res> get coach {
    return $CoachCopyWith<$Res>(_value.coach, (value) {
      return _then(_value.copyWith(coach: value));
    });
  }
}

/// @nodoc
abstract class _$LineupCopyWith<$Res> implements $LineupCopyWith<$Res> {
  factory _$LineupCopyWith(_Lineup value, $Res Function(_Lineup) then) =
      __$LineupCopyWithImpl<$Res>;
  @override
  $Res call(
      {Team team,
      String formation,
      List<Player> startXI,
      List<Player> substitutes,
      Coach coach});

  @override
  $TeamCopyWith<$Res> get team;
  @override
  $CoachCopyWith<$Res> get coach;
}

/// @nodoc
class __$LineupCopyWithImpl<$Res> extends _$LineupCopyWithImpl<$Res>
    implements _$LineupCopyWith<$Res> {
  __$LineupCopyWithImpl(_Lineup _value, $Res Function(_Lineup) _then)
      : super(_value, (v) => _then(v as _Lineup));

  @override
  _Lineup get _value => super._value as _Lineup;

  @override
  $Res call({
    Object? team = freezed,
    Object? formation = freezed,
    Object? startXI = freezed,
    Object? substitutes = freezed,
    Object? coach = freezed,
  }) {
    return _then(_Lineup(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      formation: formation == freezed
          ? _value.formation
          : formation // ignore: cast_nullable_to_non_nullable
              as String,
      startXI: startXI == freezed
          ? _value.startXI
          : startXI // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      substitutes: substitutes == freezed
          ? _value.substitutes
          : substitutes // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      coach: coach == freezed
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as Coach,
    ));
  }
}

/// @nodoc

class _$_Lineup implements _Lineup {
  _$_Lineup(
      {required this.team,
      required this.formation,
      required this.startXI,
      required this.substitutes,
      required this.coach});

  @override
  final Team team;
  @override
  final String formation;
  @override
  final List<Player> startXI;
  @override
  final List<Player> substitutes;
  @override
  final Coach coach;

  @override
  String toString() {
    return 'Lineup(team: $team, formation: $formation, startXI: $startXI, substitutes: $substitutes, coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Lineup &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.formation, formation) &&
            const DeepCollectionEquality().equals(other.startXI, startXI) &&
            const DeepCollectionEquality()
                .equals(other.substitutes, substitutes) &&
            const DeepCollectionEquality().equals(other.coach, coach));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(formation),
      const DeepCollectionEquality().hash(startXI),
      const DeepCollectionEquality().hash(substitutes),
      const DeepCollectionEquality().hash(coach));

  @JsonKey(ignore: true)
  @override
  _$LineupCopyWith<_Lineup> get copyWith =>
      __$LineupCopyWithImpl<_Lineup>(this, _$identity);
}

abstract class _Lineup implements Lineup {
  factory _Lineup(
      {required Team team,
      required String formation,
      required List<Player> startXI,
      required List<Player> substitutes,
      required Coach coach}) = _$_Lineup;

  @override
  Team get team;
  @override
  String get formation;
  @override
  List<Player> get startXI;
  @override
  List<Player> get substitutes;
  @override
  Coach get coach;
  @override
  @JsonKey(ignore: true)
  _$LineupCopyWith<_Lineup> get copyWith => throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
class _$PlayerTearOff {
  const _$PlayerTearOff();

  _Player call(
      {required int id,
      required String name,
      required int? number,
      required String? pos,
      required String? grid}) {
    return _Player(
      id: id,
      name: name,
      number: number,
      pos: pos,
      grid: grid,
    );
  }

  Player fromJson(Map<String, Object?> json) {
    return Player.fromJson(json);
  }
}

/// @nodoc
const $Player = _$PlayerTearOff();

/// @nodoc
mixin _$Player {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  String? get pos => throw _privateConstructorUsedError;
  String? get grid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res>;
  $Res call({int id, String name, int? number, String? pos, String? grid});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res> implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  final Player _value;
  // ignore: unused_field
  final $Res Function(Player) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? pos = freezed,
    Object? grid = freezed,
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
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as String?,
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$PlayerCopyWith(_Player value, $Res Function(_Player) then) =
      __$PlayerCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, int? number, String? pos, String? grid});
}

/// @nodoc
class __$PlayerCopyWithImpl<$Res> extends _$PlayerCopyWithImpl<$Res>
    implements _$PlayerCopyWith<$Res> {
  __$PlayerCopyWithImpl(_Player _value, $Res Function(_Player) _then)
      : super(_value, (v) => _then(v as _Player));

  @override
  _Player get _value => super._value as _Player;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? number = freezed,
    Object? pos = freezed,
    Object? grid = freezed,
  }) {
    return _then(_Player(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as String?,
      grid: grid == freezed
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Player implements _Player {
  _$_Player(
      {required this.id,
      required this.name,
      required this.number,
      required this.pos,
      required this.grid});

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? number;
  @override
  final String? pos;
  @override
  final String? grid;

  @override
  String toString() {
    return 'Player(id: $id, name: $name, number: $number, pos: $pos, grid: $grid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Player &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.pos, pos) &&
            const DeepCollectionEquality().equals(other.grid, grid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(pos),
      const DeepCollectionEquality().hash(grid));

  @JsonKey(ignore: true)
  @override
  _$PlayerCopyWith<_Player> get copyWith =>
      __$PlayerCopyWithImpl<_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerToJson(this);
  }
}

abstract class _Player implements Player {
  factory _Player(
      {required int id,
      required String name,
      required int? number,
      required String? pos,
      required String? grid}) = _$_Player;

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get number;
  @override
  String? get pos;
  @override
  String? get grid;
  @override
  @JsonKey(ignore: true)
  _$PlayerCopyWith<_Player> get copyWith => throw _privateConstructorUsedError;
}

Coach _$CoachFromJson(Map<String, dynamic> json) {
  return _Coach.fromJson(json);
}

/// @nodoc
class _$CoachTearOff {
  const _$CoachTearOff();

  _Coach call({required int id, required String name, required String? photo}) {
    return _Coach(
      id: id,
      name: name,
      photo: photo,
    );
  }

  Coach fromJson(Map<String, Object?> json) {
    return Coach.fromJson(json);
  }
}

/// @nodoc
const $Coach = _$CoachTearOff();

/// @nodoc
mixin _$Coach {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoachCopyWith<Coach> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachCopyWith<$Res> {
  factory $CoachCopyWith(Coach value, $Res Function(Coach) then) =
      _$CoachCopyWithImpl<$Res>;
  $Res call({int id, String name, String? photo});
}

/// @nodoc
class _$CoachCopyWithImpl<$Res> implements $CoachCopyWith<$Res> {
  _$CoachCopyWithImpl(this._value, this._then);

  final Coach _value;
  // ignore: unused_field
  final $Res Function(Coach) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
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
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CoachCopyWith<$Res> implements $CoachCopyWith<$Res> {
  factory _$CoachCopyWith(_Coach value, $Res Function(_Coach) then) =
      __$CoachCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String? photo});
}

/// @nodoc
class __$CoachCopyWithImpl<$Res> extends _$CoachCopyWithImpl<$Res>
    implements _$CoachCopyWith<$Res> {
  __$CoachCopyWithImpl(_Coach _value, $Res Function(_Coach) _then)
      : super(_value, (v) => _then(v as _Coach));

  @override
  _Coach get _value => super._value as _Coach;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
  }) {
    return _then(_Coach(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coach implements _Coach {
  _$_Coach({required this.id, required this.name, required this.photo});

  factory _$_Coach.fromJson(Map<String, dynamic> json) =>
      _$$_CoachFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? photo;

  @override
  String toString() {
    return 'Coach(id: $id, name: $name, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Coach &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photo));

  @JsonKey(ignore: true)
  @override
  _$CoachCopyWith<_Coach> get copyWith =>
      __$CoachCopyWithImpl<_Coach>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoachToJson(this);
  }
}

abstract class _Coach implements Coach {
  factory _Coach(
      {required int id,
      required String name,
      required String? photo}) = _$_Coach;

  factory _Coach.fromJson(Map<String, dynamic> json) = _$_Coach.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$CoachCopyWith<_Coach> get copyWith => throw _privateConstructorUsedError;
}
