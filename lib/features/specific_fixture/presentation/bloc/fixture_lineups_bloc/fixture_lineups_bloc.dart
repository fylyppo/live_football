import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';

import '../../../../../core/error/failures.dart';
import '../fixture_bloc/fixture_bloc.dart';

part 'fixture_lineups_event.dart';
part 'fixture_lineups_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = ' Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input The number must be a positive integer or zero.';

class FixtureLineupsBloc extends Bloc<FixtureLineupsEvent, FixtureLineupsState> {
  final GetFixtureLineups getFixtureLineups;
  
  FixtureLineupsBloc({required this.getFixtureLineups}) : super(Empty()) {
    on<FixtureLineupsEvent>((event, emit) async {
      if (event is GetFixtureLineupsForId) {
        emit(Loading());
        final failureOrLineups =
            await getFixtureLineups(LineupsParams(fixtureId: event.fixtureId));
        emit(failureOrLineups.fold(
            (failure) => Error(
                message: _mapFailureToMessage(failure)),
            (lineups) => Loaded(lineups: lineups!)));
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
