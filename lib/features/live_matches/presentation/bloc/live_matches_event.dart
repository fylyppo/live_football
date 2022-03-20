part of 'live_matches_bloc.dart';

abstract class LiveMatchesEvent extends Equatable {
  const LiveMatchesEvent([List props = const <dynamic>[]]);

  @override
  List<Object> get props => [props];
}

class GetLiveMatches extends LiveMatchesEvent {
  final String leagueString;

  GetLiveMatches(this.leagueString): super([leagueString]);
}
