part of 'live_matches_bloc.dart';

abstract class LiveMatchesEvent extends Equatable {
  const LiveMatchesEvent();

  @override
  List<Object> get props => [props];
}

class GetLiveMatchesForLeague extends LiveMatchesEvent {
  final String leagueString;

  const GetLiveMatchesForLeague(this.leagueString);

  @override
  List<Object> get props => super.props..addAll([leagueString]);
}
