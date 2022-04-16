part of 'fixture_bloc.dart';

abstract class FixtureState extends Equatable {
  const FixtureState();
  
  @override
  List<Object> get props => [];
}

class Empty extends FixtureState {}

class Loading extends FixtureState {}

class Loaded extends FixtureState {
  final Fixture fixture;
  final String status;

  const Loaded({
    required this.fixture,
    required this.status,
  });

  @override
  List<Object> get props => super.props..addAll([fixture]);
}

class Error extends FixtureState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
