import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/usecases/usecase.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';

class GetLiveMatches implements UseCase<LiveMatches, Params>{
  final  LiveMatchesRepository repository;

  GetLiveMatches(this.repository);

  @override
  Future<Either<Failure, LiveMatches?>> call(Params params) async {
    return await repository.getLiveMatches(params.league);
  }
}

class Params extends Equatable {
  final String league;

  const Params({required this.league});

  @override
  List<Object?> get props => [league];

  
}