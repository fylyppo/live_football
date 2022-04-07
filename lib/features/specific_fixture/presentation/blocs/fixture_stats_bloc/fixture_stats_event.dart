part of 'fixture_stats_bloc.dart';

abstract class FixtureStatsEvent extends Equatable {
  const FixtureStatsEvent();

  @override
  List<Object> get props => [];
}

class GetFixtureStatsForId extends FixtureStatsEvent {
  final int id;
  
  const GetFixtureStatsForId(this.id,);
}
