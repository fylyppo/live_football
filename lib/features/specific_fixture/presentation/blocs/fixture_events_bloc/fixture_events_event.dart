part of 'fixture_events_bloc.dart';

abstract class FixtureEventsEvent extends Equatable {
  const FixtureEventsEvent();

  @override
  List<Object> get props => [];
}

class GetFixtureEventsForId extends FixtureEventsEvent {
  final int fixtureId;
  
  const GetFixtureEventsForId(
    this.fixtureId,
  );
  
  @override
  List<Object> get props => super.props..addAll([fixtureId]);
}
