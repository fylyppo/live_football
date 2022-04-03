import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/fixture_bloc/fixture_bloc.dart';
import '../../../../bloc/fixture_events_bloc/fixture_events_bloc.dart';
import '../lineups_tab/lineups_tab.dart';

class DetailsTab extends StatelessWidget {
  DetailsTab({Key? key}) : super(key: key);

  int homeId = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FixtureBloc, FixtureState>(
      listener: (context, state) {
        context.read<FixtureEventsBloc>().add(const GetFixtureEventsForId(850));
        if (state is Loaded) {
          homeId = state.fixture.teams.home.id;
        }
      },
      child: BlocBuilder<FixtureEventsBloc, FixtureEventsState>(
        builder: (context, state) {
          if (state is EventsEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventsError) {
            return Text(state.message);
          } else if (state is EventsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EventsLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const TitleTabWidget(
                      title: 'Events',
                    ),
                    EventsListTileWidget(
                      homeId: homeId,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const TitleTabWidget(
                      title: 'Match information',
                    ),
                    MatchInformationTileWidget(
                      homeId: homeId,
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class EventsListTileWidget extends StatelessWidget {
  final int homeId;

  const EventsListTileWidget({
    Key? key,
    required this.homeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtureEventsBloc, FixtureEventsState>(
      builder: (context, state) {
        if (state is EventsLoaded) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: state.events.events.length,
                  itemBuilder: (context, index) {
                    bool isHome = state.events.events[index].team.id == homeId;
                    List<Widget> event = [
                      SizedBox(
                          width: 20,
                          child: Center(
                              child: Text(state
                                      .events.events[index].time.elapsed
                                      .toString() +
                                  "'"))),
                      const SizedBox(
                        width: 10,
                      ),
                      state.events.events[index].icon.icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.events.events[index].player.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.events.events[index].assist.name != null
                            ? "(${state.events.events[index].assist.name})"
                            : '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: isHome
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: isHome ? event : event.reversed.toList(),
                      ),
                    );
                  }),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class MatchInformationTileWidget extends StatelessWidget {
  final int homeId;

  const MatchInformationTileWidget({
    Key? key,
    required this.homeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<FixtureBloc, FixtureState>(
          builder: (context, state) {
            if (state is Loaded) {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(Icons.event, size: 30,),
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Date:', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(state.fixture.fixtureData.date, style: const TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                      height: 10,
                    ),
                SizedBox(
                  //color: Colors.red,
                  height: 50,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(Icons.sports, size: 30,),
                      ),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Referee:', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(state.fixture.fixtureData.referee!, style: const TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                      height: 10,
                    ),
                SizedBox(
                  //color: Colors.red,
                  height: 50,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(Icons.stadium, size: 30,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Venue:', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(state.fixture.fixtureData.venue.name, style: const TextStyle(color: Colors.grey),),
                          Text(state.fixture.fixtureData.venue.city, style: const TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
            }
            return Container();
          },
        ),
      ),
    );
  }
}