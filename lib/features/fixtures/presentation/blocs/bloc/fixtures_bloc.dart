import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:live_football/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:live_football/features/specific_fixture/domain/entities/fixture.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/messages/messages.dart';

part 'fixtures_bloc.freezed.dart';
part 'fixtures_event.dart';
part 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesState> {
  final GetFixtures getFixtures;

  FixturesBloc({
    required this.getFixtures,
  }) : super(const _Initial()) {
    on<FixturesEvent>((event, emit) async {
      if (event is _GetFixturesForParameters) {
        emit(const _Loading());
        final failureOrEvents = await getFixtures(FixturesParams(
          live: event.live,
          date: event.date,
          league: event.league,
          season: event.season,
          team: event.team,
          last: event.last,
          next: event.next,
          from: event.from,
          to: event.to,
          round: event.round,
          status: event.status,
        ));
        emit(failureOrEvents.fold(
            (failure) => _FixturesError(message: _mapFailureToMessage(failure)),
            (fixtures) {
              if (fixtures.isEmpty) {
                return const _FixturesEmpty();
              }
              return _Loaded(fixtures: fixtures);
            } ));
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
