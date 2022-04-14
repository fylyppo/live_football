// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fixture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FixtureModel _$FixtureModelFromJson(Map<String, dynamic> json) {
  return _FixtureModel.fromJson(json);
}

/// @nodoc
class _$FixtureModelTearOff {
  const _$FixtureModelTearOff();

  _FixtureModel call(
      {required FixtureData fixture,
      required League league,
      required Teams teams,
      required Goals goals}) {
    return _FixtureModel(
      fixture: fixture,
      league: league,
      teams: teams,
      goals: goals,
    );
  }

  FixtureModel fromJson(Map<String, Object?> json) {
    return FixtureModel.fromJson(json);
  }
}

/// @nodoc
const $FixtureModel = _$FixtureModelTearOff();

/// @nodoc
mixin _$FixtureModel {
  FixtureData get fixture => throw _privateConstructorUsedError;
  League get league => throw _privateConstructorUsedError;
  Teams get teams => throw _privateConstructorUsedError;
  Goals get goals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FixtureModelCopyWith<FixtureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureModelCopyWith<$Res> {
  factory $FixtureModelCopyWith(
          FixtureModel value, $Res Function(FixtureModel) then) =
      _$FixtureModelCopyWithImpl<$Res>;
  $Res call({FixtureData fixture, League league, Teams teams, Goals goals});

  $FixtureDataCopyWith<$Res> get fixture;
  $LeagueCopyWith<$Res> get league;
  $TeamsCopyWith<$Res> get teams;
  $GoalsCopyWith<$Res> get goals;
}

/// @nodoc
class _$FixtureModelCopyWithImpl<$Res> implements $FixtureModelCopyWith<$Res> {
  _$FixtureModelCopyWithImpl(this._value, this._then);

  final FixtureModel _value;
  // ignore: unused_field
  final $Res Function(FixtureModel) _then;

  @override
  $Res call({
    Object? fixture = freezed,
    Object? league = freezed,
    Object? teams = freezed,
    Object? goals = freezed,
  }) {
    return _then(_value.copyWith(
      fixture: fixture == freezed
          ? _value.fixture
          : fixture // ignore: cast_nullable_to_non_nullable
              as FixtureData,
      league: league == freezed
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as Teams,
      goals: goals == freezed
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Goals,
    ));
  }

  @override
  $FixtureDataCopyWith<$Res> get fixture {
    return $FixtureDataCopyWith<$Res>(_value.fixture, (value) {
      return _then(_value.copyWith(fixture: value));
    });
  }

  @override
  $LeagueCopyWith<$Res> get league {
    return $LeagueCopyWith<$Res>(_value.league, (value) {
      return _then(_value.copyWith(league: value));
    });
  }

  @override
  $TeamsCopyWith<$Res> get teams {
    return $TeamsCopyWith<$Res>(_value.teams, (value) {
      return _then(_value.copyWith(teams: value));
    });
  }

  @override
  $GoalsCopyWith<$Res> get goals {
    return $GoalsCopyWith<$Res>(_value.goals, (value) {
      return _then(_value.copyWith(goals: value));
    });
  }
}

/// @nodoc
abstract class _$FixtureModelCopyWith<$Res>
    implements $FixtureModelCopyWith<$Res> {
  factory _$FixtureModelCopyWith(
          _FixtureModel value, $Res Function(_FixtureModel) then) =
      __$FixtureModelCopyWithImpl<$Res>;
  @override
  $Res call({FixtureData fixture, League league, Teams teams, Goals goals});

  @override
  $FixtureDataCopyWith<$Res> get fixture;
  @override
  $LeagueCopyWith<$Res> get league;
  @override
  $TeamsCopyWith<$Res> get teams;
  @override
  $GoalsCopyWith<$Res> get goals;
}

/// @nodoc
class __$FixtureModelCopyWithImpl<$Res> extends _$FixtureModelCopyWithImpl<$Res>
    implements _$FixtureModelCopyWith<$Res> {
  __$FixtureModelCopyWithImpl(
      _FixtureModel _value, $Res Function(_FixtureModel) _then)
      : super(_value, (v) => _then(v as _FixtureModel));

  @override
  _FixtureModel get _value => super._value as _FixtureModel;

  @override
  $Res call({
    Object? fixture = freezed,
    Object? league = freezed,
    Object? teams = freezed,
    Object? goals = freezed,
  }) {
    return _then(_FixtureModel(
      fixture: fixture == freezed
          ? _value.fixture
          : fixture // ignore: cast_nullable_to_non_nullable
              as FixtureData,
      league: league == freezed
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as League,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as Teams,
      goals: goals == freezed
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Goals,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FixtureModel extends _FixtureModel {
  _$_FixtureModel(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals})
      : super._();

  factory _$_FixtureModel.fromJson(Map<String, dynamic> json) =>
      _$$_FixtureModelFromJson(json);

  @override
  final FixtureData fixture;
  @override
  final League league;
  @override
  final Teams teams;
  @override
  final Goals goals;

  @override
  String toString() {
    return 'FixtureModel(fixture: $fixture, league: $league, teams: $teams, goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FixtureModel &&
            const DeepCollectionEquality().equals(other.fixture, fixture) &&
            const DeepCollectionEquality().equals(other.league, league) &&
            const DeepCollectionEquality().equals(other.teams, teams) &&
            const DeepCollectionEquality().equals(other.goals, goals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fixture),
      const DeepCollectionEquality().hash(league),
      const DeepCollectionEquality().hash(teams),
      const DeepCollectionEquality().hash(goals));

  @JsonKey(ignore: true)
  @override
  _$FixtureModelCopyWith<_FixtureModel> get copyWith =>
      __$FixtureModelCopyWithImpl<_FixtureModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FixtureModelToJson(this);
  }
}

abstract class _FixtureModel extends FixtureModel {
  factory _FixtureModel(
      {required FixtureData fixture,
      required League league,
      required Teams teams,
      required Goals goals}) = _$_FixtureModel;
  _FixtureModel._() : super._();

  factory _FixtureModel.fromJson(Map<String, dynamic> json) =
      _$_FixtureModel.fromJson;

  @override
  FixtureData get fixture;
  @override
  League get league;
  @override
  Teams get teams;
  @override
  Goals get goals;
  @override
  @JsonKey(ignore: true)
  _$FixtureModelCopyWith<_FixtureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
