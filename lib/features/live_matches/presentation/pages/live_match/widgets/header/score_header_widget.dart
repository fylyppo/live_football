import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../domain/entities/live_matches.dart';
import 'elapsed_time_header_widget.dart';


class ScoreHeaderWidget extends StatelessWidget {
  final Goals goals;
  final Status status;
  final double shrinkOffset;
  const ScoreHeaderWidget(
      {Key? key,
      required this.goals,
      required this.status,
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
            goals.home.toString() + ' : ' + goals.away.toString(),
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          ElapsedTimeWidget(status: status, shrinkOffset: shrinkOffset),
          // shrinkOffset < 80
          //     ? Text(status.elapsed.toString() + "'",
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             color:
          //                 Colors.green.withOpacity(TextOpacity.titleOpacity(shrinkOffset))))
          //     : Container()
        ],
      )),
    );
  }
}