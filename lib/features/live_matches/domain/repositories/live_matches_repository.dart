import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';

abstract class LiveMatchesRepository {
  Future<Either<Failure, LiveMatches>> getLiveMatches(String? league);
}