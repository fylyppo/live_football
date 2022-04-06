part of 'fixture_lineups_bloc.dart';

abstract class FixtureLineupsEvent extends Equatable {
  const FixtureLineupsEvent();

  @override
  List<Object> get props => [];
}

class GetFixtureLineupsForId extends FixtureLineupsEvent {
  final int fixtureId;
  
  const GetFixtureLineupsForId(
    this.fixtureId,
  );
  
  @override
  List<Object> get props => super.props..addAll([fixtureId]);
}
