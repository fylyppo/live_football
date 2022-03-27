import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class FixtureLineupsUseCase<Type, LineupsParams> {
  Future<Either<Failure, Type?>?> call(LineupsParams params);
}