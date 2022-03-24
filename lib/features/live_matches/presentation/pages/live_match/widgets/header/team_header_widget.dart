import 'package:flutter/material.dart';
import 'package:live_football/features/live_matches/presentation/widgets/text_opacity.dart';
import '../../../../../domain/entities/live_matches.dart';


class TeamHeaderWidget extends StatelessWidget {
  final Team team;
  final double shrinkOffset;
  const TeamHeaderWidget(
      {Key? key, required this.team, required this.shrinkOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              team.logo,
              width: shrinkOffset < 100
                  ? 60
                  : (shrinkOffset < 120 ? 160 - shrinkOffset : 40),
            ),
            shrinkOffset < 80
                ? Text(
                    team.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(
                            TextOpacity.titleOpacity(shrinkOffset))),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}