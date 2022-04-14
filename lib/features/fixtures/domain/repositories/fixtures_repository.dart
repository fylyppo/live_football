import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';

abstract class FixturesRepository {
  Future<Either<Failure, List<Fixture>>> getFixtures({
      String? live,
      String? date,
      int? league,
      int? season,
      int? team,
      int? last,
      int? next,
      String? from,
      String? to,
      String? round,
      String? status});
}
