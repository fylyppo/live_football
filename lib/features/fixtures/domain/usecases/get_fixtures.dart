import 'package:equatable/equatable.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:live_football/features/fixtures/domain/repositories/fixtures_repository.dart';
import '../../../../core/usecases/fixtures_usecase.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';

class GetFixtures implements GetFixturesUseCase<List<Fixture>, FixturesParams> {
  final FixturesRepository repository;

  GetFixtures(this.repository);

  @override
  Future<Either<Failure, List<Fixture>>> call(params) {
    return repository.getFixtures(
        live: params.live,
        date: params.date,
        league: params.league,
        season: params.season,
        team: params.team,
        last: params.last,
        next: params.next,
        from: params.from,
        to: params.to,
        round: params.round,
        status: params.status);
  }
}

class FixturesParams extends Equatable {
  final String? live;
  final String? date;
  final int? league;
  final int? season;
  final int? team;
  final int? last;
  final int? next;
  final String? from;
  final String? to;
  final String? round;
  final String? status;

  const FixturesParams(
      {this.live,
      this.date,
      this.league,
      this.season,
      this.team,
      this.last,
      this.next,
      this.from,
      this.to,
      this.round,
      this.status});

  @override
  List<Object?> get props =>
      [live, date, league, season, team, last, next, from, to, round, status];
}
