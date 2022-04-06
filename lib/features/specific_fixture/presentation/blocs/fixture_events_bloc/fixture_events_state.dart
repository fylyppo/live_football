part of 'fixture_events_bloc.dart';

abstract class FixtureEventsState extends Equatable {
  const FixtureEventsState();
  
  @override
  List<Object> get props => [];
}

class EventsEmpty extends FixtureEventsState {}

class EventsLoading extends FixtureEventsState {}

class EventsLoaded extends FixtureEventsState {
  final Events events;

  const EventsLoaded({required this.events});

  @override
  List<Object> get props => super.props..addAll([events]);
}

class EventsError extends FixtureEventsState {
  final String message;

  const EventsError({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
