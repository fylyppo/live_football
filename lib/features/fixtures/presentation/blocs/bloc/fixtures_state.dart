part of 'fixtures_bloc.dart';

@freezed
class FixturesState with _$FixturesState {
  const factory FixturesState.initial() = _Initial;
  const factory FixturesState.loading() = _Loading;
  const factory FixturesState.loaded({required final List<Fixture> fixtures}) = _Loaded;
  const factory FixturesState.fixturesError({required final String message}) = _FixturesError;
  const factory FixturesState.fixturesEmpty() = _FixturesEmpty;
}