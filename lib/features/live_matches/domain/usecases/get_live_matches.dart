import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';

class GetLiveMatches {
  final  LiveMatchesRepository repository;

  GetLiveMatches(this.repository);

  Future<Either<Failure, LiveMatches>> execute({required String live}) async {
    return await repository.getLiveMatches(live);
  }
}