import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../blocs/fixture_bloc/fixture_bloc.dart';
import '../../../../blocs/fixture_events_bloc/fixture_events_bloc.dart';
import '../lineups_tab/lineups_tab.dart';

class DetailsTab extends StatelessWidget {
  final int id;

  DetailsTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  int homeId = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FixtureBloc, FixtureState>(
      listener: (context, state) {
        if (state is Loaded) {
          homeId = state.fixture.teams.home.id;
        }
      },
      child: BlocBuilder<FixtureEventsBloc, FixtureEventsState>(
        builder: (context, state) {
          if (state is EventsEmpty) {
            context.read<FixtureEventsBloc>().add(GetFixtureEventsForId(id));
            return Container();
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
                    if (state.events.isNotEmpty)
                      Column(
                        children: [
                          const TitleTabWidget(
                            title: 'Events',
                          ),
                          EventsListTileWidget(
                            homeId: homeId,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
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
                  itemCount: state.events.length,
                  itemBuilder: (context, index) {
                    bool isHome = state.events[index].team.id == homeId;
                    List<Widget> event = [
                      SizedBox(
                          width: 20,
                          child: Center(
                              child: Text(state
                                      .events[index].time.elapsed
                                      .toString() +
                                  "'"))),
                      const SizedBox(
                        width: 10,
                      ),
                      //state.events[index].icon.icon,
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.events[index].player.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        state.events[index].assist.name != null
                            ? "(${state.events[index].assist.name})"
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<FixtureBloc, FixtureState>(
          builder: (context, state) {
            if (state is Loaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(
                          Icons.event,
                          size: 30,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Date:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMEd().add_jms().format(
                                DateTime.parse(state.fixture.fixture.date).toLocal()),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  state.fixture.fixture.referee != null ?
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(
                          Icons.sports,
                          size: 30,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Referee:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.fixture.fixture.referee ?? '',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ) : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  !(state.fixture.fixture.venue.city == null && state.fixture.fixture.venue.name == null) ?
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 6, right: 14.0),
                        child: Icon(
                          Icons.stadium,
                          size: 30,
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Venue:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.fixture.fixture.venue.name ?? '',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              state.fixture.fixture.venue.city ?? '',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ) : Container()
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
