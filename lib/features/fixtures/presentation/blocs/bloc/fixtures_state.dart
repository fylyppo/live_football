part of 'fixtures_bloc.dart';

@freezed
class FixturesState with _$FixturesState {
  const factory FixturesState.initial() = Initial;
  const factory FixturesState.loading() = Loading;
  const factory FixturesState.loaded({required final List<Fixture> fixtures}) = Loaded;
  const factory FixturesState.fixturesError({required final String message}) = FixturesError;
}