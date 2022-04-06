part of 'fixture_bloc.dart';

abstract class FixtureEvent extends Equatable {
  const FixtureEvent();

  @override
  List<Object> get props => [props];
}

class GetFixtureForId extends FixtureEvent {
  final int fixtureId;

  const GetFixtureForId(this.fixtureId);

  @override
  List<Object> get props => super.props..addAll([fixtureId]);
}
