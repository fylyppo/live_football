part of 'live_matches_bloc.dart';

abstract class LiveMatchesState extends Equatable {
  const LiveMatchesState();
  
  @override
  List<Object> get props => [];
}

class Empty extends LiveMatchesState {}

class Loading extends LiveMatchesState {}

class Loaded extends LiveMatchesState {
  final LiveMatches liveMatches;

  const Loaded({required this.liveMatches});

  @override
  List<Object> get props => super.props..addAll([liveMatches]);
}

class Error extends LiveMatchesState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
