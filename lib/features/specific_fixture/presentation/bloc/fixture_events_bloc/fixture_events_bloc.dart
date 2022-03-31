import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/events.dart';
part 'fixture_events_event.dart';
part 'fixture_events_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = ' Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input The number must be a positive integer or zero.';

class FixtureEventsBloc extends Bloc<FixtureEventsEvent, FixtureEventsState> {
  final GetFixtureEvents getFixtureEvents;
  
  FixtureEventsBloc({ required this.getFixtureEvents}) : super(Empty()) {
    on<FixtureEventsEvent>((event, emit) async {
      if(event is GetFixtureEventsForId) {
        emit(Loading());
        final failureOrEvents = await getFixtureEvents(FixtureParams(id: event.fixtureId));
        emit(failureOrEvents.fold((failure) => Error(message: _mapFailureToMessage(failure)), (events) => Loaded(events: events)));
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
