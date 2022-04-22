import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import '../entities/event.dart';

abstract class FixtureEventsRepository {
  Future<Either<Failure, List<Event>>>getFixtureEvents(int id);
}