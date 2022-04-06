import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/features/specific_fixture/domain/repositories/fixture_stats_repository.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_stats.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/messages/messages.dart';
import '../../../domain/entities/stats.dart';

part 'fixture_stats_event.dart';
part 'fixture_stats_state.dart';

class FixtureStatsBloc extends Bloc<FixtureStatsEvent, FixtureStatsState> {
  final GetFixtureStats getFixtureStats;
  
  FixtureStatsBloc({required this.getFixtureStats}) : super(Empty()) {
    on<FixtureStatsEvent>((event, emit) async {
      if (event is GetFixtureStatsForId) {
        emit(Loading());
        final failureOrStats = await getFixtureStats(FixtureParams(id:  event.id));
        emit(failureOrStats.fold((failure) => Error(message: _mapFailureToMessage(failure)), (stats) => Loaded(stats: stats)));
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
