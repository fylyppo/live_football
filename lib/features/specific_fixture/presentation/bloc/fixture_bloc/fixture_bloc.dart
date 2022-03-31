import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/util/input_converter.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/error/messages/messages.dart';
import '../../../domain/entities/fixture.dart';
import '../../../domain/usecases/get_fixture.dart';

part 'fixture_event.dart';
part 'fixture_state.dart';

class FixtureBloc extends Bloc<FixtureEvent, FixtureState> {
  final GetFixture getFixture;
  final InputConverter inputConverter;

  FixtureBloc({required this.getFixture, required this.inputConverter})
      : super(Empty()) {
    on<FixtureEvent>((event, emit) async {
      if (event is GetFixtureForId) {
        emit(Loading());
        final failureOrFixture =
            await getFixture(FixtureParams(id: event.fixtureId));
        emit(failureOrFixture.fold(
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
