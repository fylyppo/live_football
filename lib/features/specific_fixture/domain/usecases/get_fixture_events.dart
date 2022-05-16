import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_events_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/event.dart';

class GetFixtureEvents implements UseCase<List<Event>, FixtureParams> {
  final FixtureEventsRepository repository;

  GetFixtureEvents(
    this.repository,
  );

  @override
  Future<Either<Failure, List<Event>>> call(params) async {
    return await repository.getFixtureEvents(params.id);
  }
}
