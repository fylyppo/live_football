import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/usecases/fixture_events_usecase.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_events_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';

import '../entities/events.dart';

class GetFixtureEvents implements FixtureEventsUseCase<Events, FixtureParams> {
  final FixtureEventsRepository repository;
  
  GetFixtureEvents(
    this.repository,
  );
  
  @override
  Future<Either<Failure, Events>> call(params) async {
    return await repository.getFixtureEvents(params.id);
  }

}