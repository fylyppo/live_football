import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../domain/entities/fixture.dart';
import 'elapsed_time_header_widget.dart';

class ScoreHeaderWidget extends StatelessWidget {
  final Fixture fixture;
  final double shrinkOffset;
  ScoreHeaderWidget(
      {Key? key, required this.fixture, required this.shrinkOffset})
      : super(key: key);

  List<String> liveStatus = ['1H', 'HT', '2H', 'ET', 'P', 'LIVE'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shrinkOffset < 100 ? 70 : max(70 - shrinkOffset + 100, 50),
      color: Colors.grey[900],
      width: 100,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        fixture.goals.home.toString() +
            ' : ' +
            fixture.goals.away.toString(),
        style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
      ),
      if (liveStatus.contains(fixture.fixture.status.short))
        ElapsedTimeWidget(
            status: fixture.fixture.status, shrinkOffset: shrinkOffset),
        ],
      ),
    );
  }
}
