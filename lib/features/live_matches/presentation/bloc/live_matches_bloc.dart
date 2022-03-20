import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';

part 'live_matches_event.dart';
part 'live_matches_state.dart';

class LiveMatchesBloc extends Bloc<LiveMatchesEvent, LiveMatchesState> {
  LiveMatchesBloc() : super(Empty()) {
    on<LiveMatchesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
