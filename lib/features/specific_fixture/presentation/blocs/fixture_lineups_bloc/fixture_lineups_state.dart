part of 'fixture_lineups_bloc.dart';

abstract class FixtureLineupsState extends Equatable {
  const FixtureLineupsState();
  
  @override
  List<Object> get props => [];
}

class Empty extends FixtureLineupsState {}

class Loading extends FixtureLineupsState {}

class Loaded extends FixtureLineupsState {
  final Lineups lineups;
  
  const Loaded({
    required this.lineups,
  });

  @override
  List<Object> get props => super.props..addAll([lineups]);
}

class Error extends FixtureLineupsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
