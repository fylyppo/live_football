import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:live_football/features/live_matches/presentation/bloc/live_matches_bloc.dart';

class LiveMatchesPage extends StatelessWidget {
  const LiveMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveMatches'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<LiveMatchesBloc, LiveMatchesState>(
            builder: (context, state) {
              if(state is Empty) {
                return const Text("It's nothing here.");
              } else if(state is Error) {
                return Text(state.message);
              }
              else if(state is Loading) {
                return Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading..."),
                  ],
                );
              }
              else if(state is Loaded) {
                return DisplayMatches(liveMatches: state.liveMatches);
              }
              return Container();
            },
          ),
          IconButton(onPressed: (){
            BlocProvider.of<LiveMatchesBloc>(context).add(GetLiveMatchesForLeague('es'));
          }, icon: Icon(Icons.start))
        ],
      ),
    );
  }
}

class DisplayMatches extends StatelessWidget {
  final LiveMatches liveMatches;
  
  const DisplayMatches({
    Key? key,
    required this.liveMatches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text(liveMatches.matches[0].fixture.id.toString()),
       Text(liveMatches.matches[0].fixture.referee.toString()),
      ],
    );
  }
}
