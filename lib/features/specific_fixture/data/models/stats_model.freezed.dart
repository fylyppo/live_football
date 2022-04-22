// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) {
  return _StatsModel.fromJson(json);
}

/// @nodoc
class _$StatsModelTearOff {
  const _$StatsModelTearOff();

  _StatsModel call({required Team team, required List<Stat> statistics}) {
    return _StatsModel(
      team: team,
      statistics: statistics,
    );
  }

  StatsModel fromJson(Map<String, Object?> json) {
    return StatsModel.fromJson(json);
  }
}

/// @nodoc
const $StatsModel = _$StatsModelTearOff();

/// @nodoc
mixin _$StatsModel {
  Team get team => throw _privateConstructorUsedError;
  List<Stat> get statistics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsModelCopyWith<StatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsModelCopyWith<$Res> {
  factory $StatsModelCopyWith(
          StatsModel value, $Res Function(StatsModel) then) =
      _$StatsModelCopyWithImpl<$Res>;
  $Res call({Team team, List<Stat> statistics});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$StatsModelCopyWithImpl<$Res> implements $StatsModelCopyWith<$Res> {
  _$StatsModelCopyWithImpl(this._value, this._then);

  final StatsModel _value;
  // ignore: unused_field
  final $Res Function(StatsModel) _then;

  @override
  $Res call({
    Object? team = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_value.copyWith(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
    ));
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc
abstract class _$StatsModelCopyWith<$Res> implements $StatsModelCopyWith<$Res> {
  factory _$StatsModelCopyWith(
          _StatsModel value, $Res Function(_StatsModel) then) =
      __$StatsModelCopyWithImpl<$Res>;
  @override
  $Res call({Team team, List<Stat> statistics});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$StatsModelCopyWithImpl<$Res> extends _$StatsModelCopyWithImpl<$Res>
    implements _$StatsModelCopyWith<$Res> {
  __$StatsModelCopyWithImpl(
      _StatsModel _value, $Res Function(_StatsModel) _then)
      : super(_value, (v) => _then(v as _StatsModel));

  @override
  _StatsModel get _value => super._value as _StatsModel;

  @override
  $Res call({
    Object? team = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_StatsModel(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<Stat>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatsModel extends _StatsModel {
  _$_StatsModel({required this.team, required this.statistics}) : super._();

  factory _$_StatsModel.fromJson(Map<String, dynamic> json) =>
      _$$_StatsModelFromJson(json);

  @override
  final Team team;
  @override
  final List<Stat> statistics;

  @override
  String toString() {
    return 'StatsModel(team: $team, statistics: $statistics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsModel &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality()
                .equals(other.statistics, statistics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(statistics));

  @JsonKey(ignore: true)
  @override
  _$StatsModelCopyWith<_StatsModel> get copyWith =>
      __$StatsModelCopyWithImpl<_StatsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsModelToJson(this);
  }
}

abstract class _StatsModel extends StatsModel {
  factory _StatsModel({required Team team, required List<Stat> statistics}) =
      _$_StatsModel;
  _StatsModel._() : super._();

  factory _StatsModel.fromJson(Map<String, dynamic> json) =
      _$_StatsModel.fromJson;

  @override
  Team get team;
  @override
  List<Stat> get statistics;
  @override
  @JsonKey(ignore: true)
  _$StatsModelCopyWith<_StatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
