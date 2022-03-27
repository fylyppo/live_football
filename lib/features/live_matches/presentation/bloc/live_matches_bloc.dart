import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/core/util/input_converter.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/domain/usecases/get_live_matches.dart';

import '../../../../core/error/failures.dart';

part 'live_matches_event.dart';
part 'live_matches_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = ' Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input The number must be a positive integer or zero.';

class LiveMatchesBloc extends Bloc<LiveMatchesEvent, LiveMatchesState> {
  final GetLiveMatches getLiveMatches;
  final InputConverter inputConverter;

  LiveMatchesBloc({required this.getLiveMatches, required this.inputConverter})
      : super(Empty()) {
    on<LiveMatchesEvent>((event, emit) async {
      if (event is GetLiveMatchesForLeague) {
        emit(Loading());
        final failureOrMatches =
            await getLiveMatches(FixtureParams(league: event.leagueString));
        emit(failureOrMatches.fold(
            (failure) => Error(
                message: _mapFailureToMessage(failure)),
            (matches) => Loaded(liveMatches: matches!)));
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
