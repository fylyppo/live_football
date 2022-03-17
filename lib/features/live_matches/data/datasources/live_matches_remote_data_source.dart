import '../../domain/entities/live_matches.dart';

abstract class LiveMatchesRemoteDataSource {
  Future<LiveMatches> getLiveMatches(String? league);
}