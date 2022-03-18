import '../../domain/entities/live_matches.dart';
import '../models/live_matches_model.dart';

abstract class LiveMatchesRemoteDataSource {
  Future<LiveMatchesModel>? getLiveMatches(String? league);
}