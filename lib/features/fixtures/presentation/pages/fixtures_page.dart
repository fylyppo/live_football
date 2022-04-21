import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_football/core/routing/app_router.gr.dart';
import 'package:live_football/features/fixtures/presentation/widgets/calendar_list_view.dart';
import '../../../../injection_container.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';
import '../blocs/bloc/fixtures_bloc.dart';

class FixturesPage extends StatelessWidget implements AutoRouteWrapper {
  final int id;
  final String leagueName;

  const FixturesPage({
    Key? key,
    required this.id,
    required this.leagueName,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<FixturesBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<FixturesBloc>().add(FixturesEvent.getFixturesForParameters(league: 140,season: 2021,date: DateFormat('yyyy-MM-dd').format(DateTime.now()),));
    return Scaffold(
      appBar: AppBar(
        title: Text(leagueName),
      ),
      body: Column(
        children: [
          CalendarListView(league: id, season: 2021,),
          BlocBuilder<FixturesBloc, FixturesState>(
            builder: (context, state) {
              return state.when(
                initial: () => Container(),
                loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                fixturesEmpty: () => const Center(
                    child: Text('No fixtures today'),
                  ),
                loaded: (fixtures) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: fixtures.length,
                    itemBuilder: (context, index) {
                      return FixtureListCard(
                        fixture: fixtures[index],
                      );
                    }),
                fixturesError: (message) => const Center(
                    child: Text(
                      'Error',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FixtureListCard extends StatelessWidget {
  final Fixture fixture;

  FixtureListCard({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  List<String> liveStatus = ['1H', 'HT', '2H', 'ET', 'P', 'LIVE'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.router.push(FixtureRoute(id: fixture.fixture.id));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.black),
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    child: Image.network(fixture.teams.home.logo),
                  ),
                  if (fixture.fixture.status.short != 'NS')
                    Column(
                      children: [
                        Text(
                          fixture.goals.home.toString() +
                              ' : ' +
                              fixture.goals.away.toString(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        if (liveStatus.contains(fixture.fixture.status.short))
                          const Text(
                            'LIVE!',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    )
                  else if (fixture.fixture.status.short == 'NS')
                    Column(
                      children: [
                        const Text('Starting at:',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(
                            DateFormat('Hm').format(
                                DateTime.parse(fixture.fixture.date).toLocal()),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  SizedBox(
                    height: 40,
                    child: Image.network(fixture.teams.away.logo),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
