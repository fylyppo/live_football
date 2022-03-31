part of 'fixture_events_bloc.dart';

abstract class FixtureEventsState extends Equatable {
  const FixtureEventsState();
  
  @override
  List<Object> get props => [];
}

class Empty extends FixtureEventsState {}

class Loading extends FixtureEventsState {}

class Loaded extends FixtureEventsState {
  final Events events;

  const Loaded({required this.events});

  @override
  List<Object> get props => super.props..addAll([events]);
}

class Error extends FixtureEventsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
