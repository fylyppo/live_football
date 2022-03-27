import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/util/input_converter.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/fixture.dart';
import '../../domain/usecases/get_fixture.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = ' Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input The number must be a positive integer or zero.';

class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  final GetFixture getFixture;
  final InputConverter inputConverter;

  FixtureBloc({required this.getFixture, required this.inputConverter})
      : super(Empty()) {
    on<FixtureEvent>((event, emit) async {
      if (event is GetFixtureForId) {
        emit(Loading());
        final failureOrMatches =
            await getFixture(FixtureParams(id: event.fixtureId));
        emit(failureOrMatches.fold(
            (failure) => Error(
                message: _mapFailureToMessage(failure)),
            (fixture) => Loaded(fixture: fixture!)));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
