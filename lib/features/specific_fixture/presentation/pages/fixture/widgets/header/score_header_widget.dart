import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../domain/entities/fixture.dart';
import 'elapsed_time_header_widget.dart';


class ScoreHeaderWidget extends StatelessWidget {
  final Fixture fixture;
  final double shrinkOffset;
  const ScoreHeaderWidget(
      {Key? key,
      required this.fixture,
      required this.shrinkOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shrinkOffset < 100 ? 70 : max(70 - shrinkOffset + 100, 50),
      color: Colors.grey[900],
      width: 100,
      child: Center(
          child: Column(
        children: [
          Text(
            fixture.goals.home.toString() + ' : ' + fixture.goals.away.toString(),
            style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          ElapsedTimeWidget(status: fixture.fixture.status, shrinkOffset: shrinkOffset),
        ],
      )),
    );
  }
}