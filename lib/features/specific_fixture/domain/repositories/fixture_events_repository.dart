import 'package:dartz/dartz.dart';
import 'package:live_football/core/error/failures.dart';
import '../entities/events.dart';

abstract class FixtureEventsRepository {
  Future<Either<Failure, Events>>getFixtureEvents(int id);
}