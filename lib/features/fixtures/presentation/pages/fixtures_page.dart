import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_football/core/routing/app_router.gr.dart';

import '../../../../injection_container.dart';
import '../../../specific_fixture/domain/entities/fixture.dart';
import '../blocs/bloc/fixtures_bloc.dart';

class FixturesPage extends StatelessWidget implements AutoRouteWrapper {
  const FixturesPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<FixturesBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    //context.read<FixturesBloc>().add(FixturesEvent.getFixturesForParameters(league: 140,season: 2021,date: DateFormat('yyyy-MM-dd').format(DateTime.now()),));
    context.read<FixturesBloc>().add(const FixturesEvent.getFixturesForParameters(
          league: 140,
          season: 2021,
          date: '2022-04-16',
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaLiga'),
      ),
      body: BlocBuilder<FixturesBloc, FixturesState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            fixturesEmpty: () => const Center(child: Text('No fixtures today'),),
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
    );
  }
}

class FixtureListCard extends StatelessWidget {
  final Fixture fixture;

  const FixtureListCard({
    Key? key,
    required this.fixture,
  }) : super(key: key);

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
                  Text(DateFormat('Hm')
                      .format(DateTime.parse(fixture.fixture.date).toLocal())),
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
