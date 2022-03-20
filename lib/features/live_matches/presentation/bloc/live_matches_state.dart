part of 'live_matches_bloc.dart';

abstract class LiveMatchesState extends Equatable {
  const LiveMatchesState([List props = const <dynamic>[]]);
  
  @override
  List<Object> get props => [props];
}

class Empty extends LiveMatchesState {}

class Loading extends LiveMatchesState {}

class Loaded extends LiveMatchesState {
  final LiveMatches liveMatches;

  Loaded({required this.liveMatches}): super([liveMatches]);
}

class Error extends LiveMatchesState {
  final String message;

  Error({required this.message}): super([message]);
}
