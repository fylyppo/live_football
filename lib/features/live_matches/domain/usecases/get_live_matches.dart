import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/usecases/fixture_usecase.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';

class GetLiveMatches implements FixtureUseCase<LiveMatches, FixtureParams>{
  final  LiveMatchesRepository repository;

  GetLiveMatches(this.repository);

  @override
  Future<Either<Failure, LiveMatches?>> call(FixtureParams params) async {
    return await repository.getLiveMatches(params.league);
  }
}

class FixtureParams extends Equatable {
  final String? league;

  const FixtureParams({required this.league});

  @override
  List<Object?> get props => [league];
}