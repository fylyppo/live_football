import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/lineup.dart';
import '../repositories/fixture_repository.dart';

class GetFixtureLineups implements UseCase<List<Lineup>, LineupsParams>{
  final FixtureRepository<List<Lineup>> repository;

  GetFixtureLineups(this.repository);

  @override
  Future<Either<Failure, List<Lineup>>> call(LineupsParams params) async {
    return await repository.getFixtureComponent(params.fixtureId);
  }
}

class LineupsParams extends Equatable {
  final int fixtureId;

  const LineupsParams({required this.fixtureId});

  @override
  List<Object?> get props => [fixtureId];
}