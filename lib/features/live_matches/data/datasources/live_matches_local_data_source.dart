import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';

import '../../domain/entities/live_matches.dart';

abstract class LiveMatchesLocalDataSource {
  Future<LiveMatchesModel> getLastLiveMatch();
  Future<void>? cacheLiveMatches(LiveMatchesModel? matchesToCache);
}