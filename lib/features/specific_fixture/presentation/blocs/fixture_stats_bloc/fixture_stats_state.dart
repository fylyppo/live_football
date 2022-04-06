part of 'fixture_stats_bloc.dart';

abstract class FixtureStatsState extends Equatable {
  const FixtureStatsState();
  
  @override
  List<Object> get props => [];
}

class Empty extends FixtureStatsState {}

class Loading extends FixtureStatsState {}

class Loaded extends FixtureStatsState {
  final Stats stats;
  
  const Loaded({
    required this.stats,
  });
}

class Error extends FixtureStatsState {
  final String message;
  
  const Error({
    required this.message,
  });
}
