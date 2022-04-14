// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fixture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FixtureTearOff {
  const _$FixtureTearOff();

  _Fixture call(
      {required FixtureData fixture,
      required League league,
      required Teams teams,
      required Goals goals}) {
    return _Fixture(
      fixture: fixture,
      league: league,
      teams: teams,
      goals: goals,
    );
  }
}

/// @nodoc
const $Fixture = _$FixtureTearOff();

/// @nodoc
mixin _$Fixture {
  FixtureData get fixture => throw _privateConstructorUsedError;
  League get league => throw _privateConstructorUsedError;
  Teams get teams => throw _privateConstructorUsedError;
  Goals get goals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FixtureCopyWith<Fixture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureCopyWith<$Res> {
  factory $FixtureCopyWith(Fixture value, $Res Function(Fixture) then) =
      _$FixtureCopyWithImpl<$Res>;
  $Res call({FixtureData fixture, League league, Teams teams, Goals goals});

  $FixtureDataCopyWith<$Res> get fixture;
  $LeagueCopyWith<$Res> get league;
  $TeamsCopyWith<$Res> get teams;
  $GoalsCopyWith<$Res> get goals;
}

/// @nodoc
class _$FixtureCopyWithImpl<$Res> implements $FixtureCopyWith<$Res> {
  _$FixtureCopyWithImpl(this._value, this._then);

  final Fixture _value;
  // ignore: unused_field
  final $Res Function(Fixture) _then;

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
abstract class _$FixtureCopyWith<$Res> implements $FixtureCopyWith<$Res> {
  factory _$FixtureCopyWith(_Fixture value, $Res Function(_Fixture) then) =
      __$FixtureCopyWithImpl<$Res>;
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
class __$FixtureCopyWithImpl<$Res> extends _$FixtureCopyWithImpl<$Res>
    implements _$FixtureCopyWith<$Res> {
  __$FixtureCopyWithImpl(_Fixture _value, $Res Function(_Fixture) _then)
      : super(_value, (v) => _then(v as _Fixture));

  @override
  _Fixture get _value => super._value as _Fixture;

  @override
  $Res call({
    Object? fixture = freezed,
    Object? league = freezed,
    Object? teams = freezed,
    Object? goals = freezed,
  }) {
    return _then(_Fixture(
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

class _$_Fixture implements _Fixture {
  _$_Fixture(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals});

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
    return 'Fixture(fixture: $fixture, league: $league, teams: $teams, goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fixture &&
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
  _$FixtureCopyWith<_Fixture> get copyWith =>
      __$FixtureCopyWithImpl<_Fixture>(this, _$identity);
}

abstract class _Fixture implements Fixture {
  factory _Fixture(
      {required FixtureData fixture,
      required League league,
      required Teams teams,
      required Goals goals}) = _$_Fixture;

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
  _$FixtureCopyWith<_Fixture> get copyWith =>
      throw _privateConstructorUsedError;
}

FixtureData _$FixtureDataFromJson(Map<String, dynamic> json) {
  return _FixtureData.fromJson(json);
}

/// @nodoc
class _$FixtureDataTearOff {
  const _$FixtureDataTearOff();

  _FixtureData call(
      {required int id,
      required String? referee,
      required String date,
      required Status status,
      required Venue venue}) {
    return _FixtureData(
      id: id,
      referee: referee,
      date: date,
      status: status,
      venue: venue,
    );
  }

  FixtureData fromJson(Map<String, Object?> json) {
    return FixtureData.fromJson(json);
  }
}

/// @nodoc
const $FixtureData = _$FixtureDataTearOff();

/// @nodoc
mixin _$FixtureData {
  int get id => throw _privateConstructorUsedError;
  String? get referee => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Venue get venue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FixtureDataCopyWith<FixtureData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixtureDataCopyWith<$Res> {
  factory $FixtureDataCopyWith(
          FixtureData value, $Res Function(FixtureData) then) =
      _$FixtureDataCopyWithImpl<$Res>;
  $Res call({int id, String? referee, String date, Status status, Venue venue});

  $StatusCopyWith<$Res> get status;
  $VenueCopyWith<$Res> get venue;
}

/// @nodoc
class _$FixtureDataCopyWithImpl<$Res> implements $FixtureDataCopyWith<$Res> {
  _$FixtureDataCopyWithImpl(this._value, this._then);

  final FixtureData _value;
  // ignore: unused_field
  final $Res Function(FixtureData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? referee = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? venue = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      referee: referee == freezed
          ? _value.referee
          : referee // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      venue: venue == freezed
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as Venue,
    ));
  }

  @override
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $VenueCopyWith<$Res> get venue {
    return $VenueCopyWith<$Res>(_value.venue, (value) {
      return _then(_value.copyWith(venue: value));
    });
  }
}

/// @nodoc
abstract class _$FixtureDataCopyWith<$Res>
    implements $FixtureDataCopyWith<$Res> {
  factory _$FixtureDataCopyWith(
          _FixtureData value, $Res Function(_FixtureData) then) =
      __$FixtureDataCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? referee, String date, Status status, Venue venue});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $VenueCopyWith<$Res> get venue;
}

/// @nodoc
class __$FixtureDataCopyWithImpl<$Res> extends _$FixtureDataCopyWithImpl<$Res>
    implements _$FixtureDataCopyWith<$Res> {
  __$FixtureDataCopyWithImpl(
      _FixtureData _value, $Res Function(_FixtureData) _then)
      : super(_value, (v) => _then(v as _FixtureData));

  @override
  _FixtureData get _value => super._value as _FixtureData;

  @override
  $Res call({
    Object? id = freezed,
    Object? referee = freezed,
    Object? date = freezed,
    Object? status = freezed,
    Object? venue = freezed,
  }) {
    return _then(_FixtureData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      referee: referee == freezed
          ? _value.referee
          : referee // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      venue: venue == freezed
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as Venue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FixtureData implements _FixtureData {
  _$_FixtureData(
      {required this.id,
      required this.referee,
      required this.date,
      required this.status,
      required this.venue});

  factory _$_FixtureData.fromJson(Map<String, dynamic> json) =>
      _$$_FixtureDataFromJson(json);

  @override
  final int id;
  @override
  final String? referee;
  @override
  final String date;
  @override
  final Status status;
  @override
  final Venue venue;

  @override
  String toString() {
    return 'FixtureData(id: $id, referee: $referee, date: $date, status: $status, venue: $venue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FixtureData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.referee, referee) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.venue, venue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(referee),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(venue));

  @JsonKey(ignore: true)
  @override
  _$FixtureDataCopyWith<_FixtureData> get copyWith =>
      __$FixtureDataCopyWithImpl<_FixtureData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FixtureDataToJson(this);
  }
}

abstract class _FixtureData implements FixtureData {
  factory _FixtureData(
      {required int id,
      required String? referee,
      required String date,
      required Status status,
      required Venue venue}) = _$_FixtureData;

  factory _FixtureData.fromJson(Map<String, dynamic> json) =
      _$_FixtureData.fromJson;

  @override
  int get id;
  @override
  String? get referee;
  @override
  String get date;
  @override
  Status get status;
  @override
  Venue get venue;
  @override
  @JsonKey(ignore: true)
  _$FixtureDataCopyWith<_FixtureData> get copyWith =>
      throw _privateConstructorUsedError;
}

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return _Venue.fromJson(json);
}

/// @nodoc
class _$VenueTearOff {
  const _$VenueTearOff();

  _Venue call(
      {required int? id, required String? name, required String? city}) {
    return _Venue(
      id: id,
      name: name,
      city: city,
    );
  }

  Venue fromJson(Map<String, Object?> json) {
    return Venue.fromJson(json);
  }
}

/// @nodoc
const $Venue = _$VenueTearOff();

/// @nodoc
mixin _$Venue {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VenueCopyWith<Venue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueCopyWith<$Res> {
  factory $VenueCopyWith(Venue value, $Res Function(Venue) then) =
      _$VenueCopyWithImpl<$Res>;
  $Res call({int? id, String? name, String? city});
}

/// @nodoc
class _$VenueCopyWithImpl<$Res> implements $VenueCopyWith<$Res> {
  _$VenueCopyWithImpl(this._value, this._then);

  final Venue _value;
  // ignore: unused_field
  final $Res Function(Venue) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? city = freezed,
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
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$VenueCopyWith<$Res> implements $VenueCopyWith<$Res> {
  factory _$VenueCopyWith(_Venue value, $Res Function(_Venue) then) =
      __$VenueCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, String? city});
}

/// @nodoc
class __$VenueCopyWithImpl<$Res> extends _$VenueCopyWithImpl<$Res>
    implements _$VenueCopyWith<$Res> {
  __$VenueCopyWithImpl(_Venue _value, $Res Function(_Venue) _then)
      : super(_value, (v) => _then(v as _Venue));

  @override
  _Venue get _value => super._value as _Venue;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? city = freezed,
  }) {
    return _then(_Venue(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Venue implements _Venue {
  _$_Venue({required this.id, required this.name, required this.city});

  factory _$_Venue.fromJson(Map<String, dynamic> json) =>
      _$$_VenueFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? city;

  @override
  String toString() {
    return 'Venue(id: $id, name: $name, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Venue &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(city));

  @JsonKey(ignore: true)
  @override
  _$VenueCopyWith<_Venue> get copyWith =>
      __$VenueCopyWithImpl<_Venue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VenueToJson(this);
  }
}

abstract class _Venue implements Venue {
  factory _Venue(
      {required int? id,
      required String? name,
      required String? city}) = _$_Venue;

  factory _Venue.fromJson(Map<String, dynamic> json) = _$_Venue.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get city;
  @override
  @JsonKey(ignore: true)
  _$VenueCopyWith<_Venue> get copyWith => throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
class _$StatusTearOff {
  const _$StatusTearOff();

  _Status call({required int? elapsed}) {
    return _Status(
      elapsed: elapsed,
    );
  }

  Status fromJson(Map<String, Object?> json) {
    return Status.fromJson(json);
  }
}

/// @nodoc
const $Status = _$StatusTearOff();

/// @nodoc
mixin _$Status {
  int? get elapsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call({int? elapsed});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object? elapsed = freezed,
  }) {
    return _then(_value.copyWith(
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) then) =
      __$StatusCopyWithImpl<$Res>;
  @override
  $Res call({int? elapsed});
}

/// @nodoc
class __$StatusCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(_Status _value, $Res Function(_Status) _then)
      : super(_value, (v) => _then(v as _Status));

  @override
  _Status get _value => super._value as _Status;

  @override
  $Res call({
    Object? elapsed = freezed,
  }) {
    return _then(_Status(
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Status implements _Status {
  _$_Status({required this.elapsed});

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$$_StatusFromJson(json);

  @override
  final int? elapsed;

  @override
  String toString() {
    return 'Status(elapsed: $elapsed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Status &&
            const DeepCollectionEquality().equals(other.elapsed, elapsed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elapsed));

  @JsonKey(ignore: true)
  @override
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusToJson(this);
  }
}

abstract class _Status implements Status {
  factory _Status({required int? elapsed}) = _$_Status;

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  int? get elapsed;
  @override
  @JsonKey(ignore: true)
  _$StatusCopyWith<_Status> get copyWith => throw _privateConstructorUsedError;
}

League _$LeagueFromJson(Map<String, dynamic> json) {
  return _League.fromJson(json);
}

/// @nodoc
class _$LeagueTearOff {
  const _$LeagueTearOff();

  _League call(
      {required int id,
      required String name,
      required String logo,
      required String? flag,
      required String round}) {
    return _League(
      id: id,
      name: name,
      logo: logo,
      flag: flag,
      round: round,
    );
  }

  League fromJson(Map<String, Object?> json) {
    return League.fromJson(json);
  }
}

/// @nodoc
const $League = _$LeagueTearOff();

/// @nodoc
mixin _$League {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String? get flag => throw _privateConstructorUsedError;
  String get round => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueCopyWith<League> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueCopyWith<$Res> {
  factory $LeagueCopyWith(League value, $Res Function(League) then) =
      _$LeagueCopyWithImpl<$Res>;
  $Res call({int id, String name, String logo, String? flag, String round});
}

/// @nodoc
class _$LeagueCopyWithImpl<$Res> implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._value, this._then);

  final League _value;
  // ignore: unused_field
  final $Res Function(League) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? flag = freezed,
    Object? round = freezed,
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
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) then) =
      __$LeagueCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String logo, String? flag, String round});
}

/// @nodoc
class __$LeagueCopyWithImpl<$Res> extends _$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(_League _value, $Res Function(_League) _then)
      : super(_value, (v) => _then(v as _League));

  @override
  _League get _value => super._value as _League;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? flag = freezed,
    Object? round = freezed,
  }) {
    return _then(_League(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_League implements _League {
  _$_League(
      {required this.id,
      required this.name,
      required this.logo,
      required this.flag,
      required this.round});

  factory _$_League.fromJson(Map<String, dynamic> json) =>
      _$$_LeagueFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final String? flag;
  @override
  final String round;

  @override
  String toString() {
    return 'League(id: $id, name: $name, logo: $logo, flag: $flag, round: $round)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _League &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.flag, flag) &&
            const DeepCollectionEquality().equals(other.round, round));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(flag),
      const DeepCollectionEquality().hash(round));

  @JsonKey(ignore: true)
  @override
  _$LeagueCopyWith<_League> get copyWith =>
      __$LeagueCopyWithImpl<_League>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeagueToJson(this);
  }
}

abstract class _League implements League {
  factory _League(
      {required int id,
      required String name,
      required String logo,
      required String? flag,
      required String round}) = _$_League;

  factory _League.fromJson(Map<String, dynamic> json) = _$_League.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  String? get flag;
  @override
  String get round;
  @override
  @JsonKey(ignore: true)
  _$LeagueCopyWith<_League> get copyWith => throw _privateConstructorUsedError;
}

Teams _$TeamsFromJson(Map<String, dynamic> json) {
  return _Teams.fromJson(json);
}

/// @nodoc
class _$TeamsTearOff {
  const _$TeamsTearOff();

  _Teams call({required Team home, required Team away}) {
    return _Teams(
      home: home,
      away: away,
    );
  }

  Teams fromJson(Map<String, Object?> json) {
    return Teams.fromJson(json);
  }
}

/// @nodoc
const $Teams = _$TeamsTearOff();

/// @nodoc
mixin _$Teams {
  Team get home => throw _privateConstructorUsedError;
  Team get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamsCopyWith<Teams> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamsCopyWith<$Res> {
  factory $TeamsCopyWith(Teams value, $Res Function(Teams) then) =
      _$TeamsCopyWithImpl<$Res>;
  $Res call({Team home, Team away});

  $TeamCopyWith<$Res> get home;
  $TeamCopyWith<$Res> get away;
}

/// @nodoc
class _$TeamsCopyWithImpl<$Res> implements $TeamsCopyWith<$Res> {
  _$TeamsCopyWithImpl(this._value, this._then);

  final Teams _value;
  // ignore: unused_field
  final $Res Function(Teams) _then;

  @override
  $Res call({
    Object? home = freezed,
    Object? away = freezed,
  }) {
    return _then(_value.copyWith(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team,
      away: away == freezed
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }

  @override
  $TeamCopyWith<$Res> get home {
    return $TeamCopyWith<$Res>(_value.home, (value) {
      return _then(_value.copyWith(home: value));
    });
  }

  @override
  $TeamCopyWith<$Res> get away {
    return $TeamCopyWith<$Res>(_value.away, (value) {
      return _then(_value.copyWith(away: value));
    });
  }
}

/// @nodoc
abstract class _$TeamsCopyWith<$Res> implements $TeamsCopyWith<$Res> {
  factory _$TeamsCopyWith(_Teams value, $Res Function(_Teams) then) =
      __$TeamsCopyWithImpl<$Res>;
  @override
  $Res call({Team home, Team away});

  @override
  $TeamCopyWith<$Res> get home;
  @override
  $TeamCopyWith<$Res> get away;
}

/// @nodoc
class __$TeamsCopyWithImpl<$Res> extends _$TeamsCopyWithImpl<$Res>
    implements _$TeamsCopyWith<$Res> {
  __$TeamsCopyWithImpl(_Teams _value, $Res Function(_Teams) _then)
      : super(_value, (v) => _then(v as _Teams));

  @override
  _Teams get _value => super._value as _Teams;

  @override
  $Res call({
    Object? home = freezed,
    Object? away = freezed,
  }) {
    return _then(_Teams(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as Team,
      away: away == freezed
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Teams implements _Teams {
  _$_Teams({required this.home, required this.away});

  factory _$_Teams.fromJson(Map<String, dynamic> json) =>
      _$$_TeamsFromJson(json);

  @override
  final Team home;
  @override
  final Team away;

  @override
  String toString() {
    return 'Teams(home: $home, away: $away)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Teams &&
            const DeepCollectionEquality().equals(other.home, home) &&
            const DeepCollectionEquality().equals(other.away, away));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(home),
      const DeepCollectionEquality().hash(away));

  @JsonKey(ignore: true)
  @override
  _$TeamsCopyWith<_Teams> get copyWith =>
      __$TeamsCopyWithImpl<_Teams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamsToJson(this);
  }
}

abstract class _Teams implements Teams {
  factory _Teams({required Team home, required Team away}) = _$_Teams;

  factory _Teams.fromJson(Map<String, dynamic> json) = _$_Teams.fromJson;

  @override
  Team get home;
  @override
  Team get away;
  @override
  @JsonKey(ignore: true)
  _$TeamsCopyWith<_Teams> get copyWith => throw _privateConstructorUsedError;
}

Goals _$GoalsFromJson(Map<String, dynamic> json) {
  return _Goals.fromJson(json);
}

/// @nodoc
class _$GoalsTearOff {
  const _$GoalsTearOff();

  _Goals call({required int? home, required int? away}) {
    return _Goals(
      home: home,
      away: away,
    );
  }

  Goals fromJson(Map<String, Object?> json) {
    return Goals.fromJson(json);
  }
}

/// @nodoc
const $Goals = _$GoalsTearOff();

/// @nodoc
mixin _$Goals {
  int? get home => throw _privateConstructorUsedError;
  int? get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalsCopyWith<Goals> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalsCopyWith<$Res> {
  factory $GoalsCopyWith(Goals value, $Res Function(Goals) then) =
      _$GoalsCopyWithImpl<$Res>;
  $Res call({int? home, int? away});
}

/// @nodoc
class _$GoalsCopyWithImpl<$Res> implements $GoalsCopyWith<$Res> {
  _$GoalsCopyWithImpl(this._value, this._then);

  final Goals _value;
  // ignore: unused_field
  final $Res Function(Goals) _then;

  @override
  $Res call({
    Object? home = freezed,
    Object? away = freezed,
  }) {
    return _then(_value.copyWith(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int?,
      away: away == freezed
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$GoalsCopyWith<$Res> implements $GoalsCopyWith<$Res> {
  factory _$GoalsCopyWith(_Goals value, $Res Function(_Goals) then) =
      __$GoalsCopyWithImpl<$Res>;
  @override
  $Res call({int? home, int? away});
}

/// @nodoc
class __$GoalsCopyWithImpl<$Res> extends _$GoalsCopyWithImpl<$Res>
    implements _$GoalsCopyWith<$Res> {
  __$GoalsCopyWithImpl(_Goals _value, $Res Function(_Goals) _then)
      : super(_value, (v) => _then(v as _Goals));

  @override
  _Goals get _value => super._value as _Goals;

  @override
  $Res call({
    Object? home = freezed,
    Object? away = freezed,
  }) {
    return _then(_Goals(
      home: home == freezed
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as int?,
      away: away == freezed
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Goals implements _Goals {
  _$_Goals({required this.home, required this.away});

  factory _$_Goals.fromJson(Map<String, dynamic> json) =>
      _$$_GoalsFromJson(json);

  @override
  final int? home;
  @override
  final int? away;

  @override
  String toString() {
    return 'Goals(home: $home, away: $away)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Goals &&
            const DeepCollectionEquality().equals(other.home, home) &&
            const DeepCollectionEquality().equals(other.away, away));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(home),
      const DeepCollectionEquality().hash(away));

  @JsonKey(ignore: true)
  @override
  _$GoalsCopyWith<_Goals> get copyWith =>
      __$GoalsCopyWithImpl<_Goals>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoalsToJson(this);
  }
}

abstract class _Goals implements Goals {
  factory _Goals({required int? home, required int? away}) = _$_Goals;

  factory _Goals.fromJson(Map<String, dynamic> json) = _$_Goals.fromJson;

  @override
  int? get home;
  @override
  int? get away;
  @override
  @JsonKey(ignore: true)
  _$GoalsCopyWith<_Goals> get copyWith => throw _privateConstructorUsedError;
}
