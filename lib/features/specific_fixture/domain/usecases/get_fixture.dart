import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';
import '../../../specific_fixture/domain/repositories/fixture_repository.dart';

class GetFixture implements UseCase<Fixture, FixtureParams>{
  final FixtureRepository repository;

  GetFixture(this.repository);

  @override
  Future<Either<Failure, Fixture>> call(FixtureParams params) async {
    return await repository.getFixture(params.id);
  }
}

class FixtureParams extends Equatable {
  final int id;

  const FixtureParams({required this.id});

  @override
  List<Object?> get props => [id];
}