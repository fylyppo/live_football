import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_football/features/leagues/data/datasources/constants/leagues.dart';
import 'package:live_football/core/routing/app_router.gr.dart';
import '../../data/models/league.dart';

class LeaguesPage extends StatelessWidget {
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LiveFootball'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListView.builder(
              itemCount: leaguesList.length,
              itemBuilder: (context, index) {
                return LeagueTile(league: leaguesList[index]);
              }),
        ));
  }
}

class LeagueTile extends StatelessWidget {
  final League league;
  const LeagueTile({
    Key? key,
    required this.league,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          context.router.push(FixturesRoute(id: league.league.id));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.black),
          height: 50,
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.network(league.league.logo),
                  )),
              Expanded(child: Center(child: Text(league.league.name))),
              SvgPicture.network(
                league.country.flag,
                width: 25,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
