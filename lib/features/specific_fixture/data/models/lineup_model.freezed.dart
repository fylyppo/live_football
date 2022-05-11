// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lineup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineupModel _$LineupModelFromJson(Map<String, dynamic> json) {
  return _LineupModel.fromJson(json);
}

/// @nodoc
class _$LineupModelTearOff {
  const _$LineupModelTearOff();

  _LineupModel call(
      {required Team team,
      required String formation,
      required List<Player> startXI,
      required List<Player> substitutes,
      required Coach coach}) {
    return _LineupModel(
      team: team,
      formation: formation,
      startXI: startXI,
      substitutes: substitutes,
      coach: coach,
    );
  }

  LineupModel fromJson(Map<String, Object?> json) {
    return LineupModel.fromJson(json);
  }
}

/// @nodoc
const $LineupModel = _$LineupModelTearOff();

/// @nodoc
mixin _$LineupModel {
  Team get team => throw _privateConstructorUsedError;
  String get formation => throw _privateConstructorUsedError;
  List<Player> get startXI => throw _privateConstructorUsedError;
  List<Player> get substitutes => throw _privateConstructorUsedError;
  Coach get coach => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineupModelCopyWith<LineupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineupModelCopyWith<$Res> {
  factory $LineupModelCopyWith(
          LineupModel value, $Res Function(LineupModel) then) =
      _$LineupModelCopyWithImpl<$Res>;
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
class _$LineupModelCopyWithImpl<$Res> implements $LineupModelCopyWith<$Res> {
  _$LineupModelCopyWithImpl(this._value, this._then);

  final LineupModel _value;
  // ignore: unused_field
  final $Res Function(LineupModel) _then;

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
abstract class _$LineupModelCopyWith<$Res>
    implements $LineupModelCopyWith<$Res> {
  factory _$LineupModelCopyWith(
          _LineupModel value, $Res Function(_LineupModel) then) =
      __$LineupModelCopyWithImpl<$Res>;
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
class __$LineupModelCopyWithImpl<$Res> extends _$LineupModelCopyWithImpl<$Res>
    implements _$LineupModelCopyWith<$Res> {
  __$LineupModelCopyWithImpl(
      _LineupModel _value, $Res Function(_LineupModel) _then)
      : super(_value, (v) => _then(v as _LineupModel));

  @override
  _LineupModel get _value => super._value as _LineupModel;

  @override
  $Res call({
    Object? team = freezed,
    Object? formation = freezed,
    Object? startXI = freezed,
    Object? substitutes = freezed,
    Object? coach = freezed,
  }) {
    return _then(_LineupModel(
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
@JsonSerializable()
class _$_LineupModel extends _LineupModel {
  const _$_LineupModel(
      {required this.team,
      required this.formation,
      required this.startXI,
      required this.substitutes,
      required this.coach})
      : super._();

  factory _$_LineupModel.fromJson(Map<String, dynamic> json) =>
      _$$_LineupModelFromJson(json);

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
    return 'LineupModel(team: $team, formation: $formation, startXI: $startXI, substitutes: $substitutes, coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LineupModel &&
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
  _$LineupModelCopyWith<_LineupModel> get copyWith =>
      __$LineupModelCopyWithImpl<_LineupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineupModelToJson(this);
  }
}

abstract class _LineupModel extends LineupModel {
  const factory _LineupModel(
      {required Team team,
      required String formation,
      required List<Player> startXI,
      required List<Player> substitutes,
      required Coach coach}) = _$_LineupModel;
  const _LineupModel._() : super._();

  factory _LineupModel.fromJson(Map<String, dynamic> json) =
      _$_LineupModel.fromJson;

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
  _$LineupModelCopyWith<_LineupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
