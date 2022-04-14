part of 'fixtures_bloc.dart';

@freezed
class FixturesEvent with _$FixturesEvent {
  const factory FixturesEvent.started() = _Started;
  const factory FixturesEvent.getFixturesForParameters({
    final String? live,
  final String? date,
  final int? league,
  final int? season,
  final int? team,
  final int? last,
  final int? next,
  final String? from,
  final String? to,
  final String? round,
  final String? status,
  }) = _GetFixturesForParameters;
}