import 'package:flutter/material.dart';
import '../../../../../domain/entities/fixture.dart';
import 'score_header_widget.dart';
import 'team_header_widget.dart';


class MatchPageHeaderWidget
 extends StatelessWidget {
  final Fixture fixture;
  final double shrinkOffset;

  const MatchPageHeaderWidget
  ({
    Key? key,
    required this.fixture,
    required this.shrinkOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: shrinkOffset < 100
            ? 100
            : (shrinkOffset < 150 ? 200 - shrinkOffset : 50),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TeamHeaderWidget(
              team: fixture.teams.home,
              shrinkOffset: shrinkOffset,
            ),
            ScoreHeaderWidget(
              goals: fixture.goals,
              status: fixture.fixtureData.status,
              shrinkOffset: shrinkOffset,
            ),
            TeamHeaderWidget(
              team: fixture.teams.away,
              shrinkOffset: shrinkOffset,
            ),
          ],
        ));
  }
}