import 'package:flutter/material.dart';
import '../../../../../domain/entities/live_matches.dart';
import 'score_header_widget.dart';
import 'team_header_widget.dart';


class MatchPageHeaderWidget
 extends StatelessWidget {
  final LiveMatches liveMatches;
  final double shrinkOffset;

  const MatchPageHeaderWidget
  ({
    Key? key,
    required this.liveMatches,
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
              team: liveMatches.matches[0].teams.home,
              shrinkOffset: shrinkOffset,
            ),
            ScoreHeaderWidget(
              goals: liveMatches.matches[0].goals,
              status: liveMatches.matches[0].fixture.status,
              shrinkOffset: shrinkOffset,
            ),
            TeamHeaderWidget(
              team: liveMatches.matches[0].teams.away,
              shrinkOffset: shrinkOffset,
            ),
          ],
        ));
  }
}