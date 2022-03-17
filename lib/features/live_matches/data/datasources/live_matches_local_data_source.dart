import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';

abstract class LiveMatchesLocalDataSource {
  Future<LiveMatchesModel> getLastLiveMatch();
  Future<void> cacheLiveMatch(LiveMatchesModel matchToCache);
}