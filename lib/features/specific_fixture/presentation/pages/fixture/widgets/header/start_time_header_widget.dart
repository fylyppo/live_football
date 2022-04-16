import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import '../../../../../domain/entities/fixture.dart';

class StartTimeHeaderWidget extends StatefulWidget {
  final Fixture fixture;
  final double shrinkOffset;

  const StartTimeHeaderWidget({
    Key? key,
    required this.fixture,
    required this.shrinkOffset,
  }) : super(key: key);

  @override
  State<StartTimeHeaderWidget> createState() => _StartTimeHeaderWidgetState();
}

class _StartTimeHeaderWidgetState extends State<StartTimeHeaderWidget> {
  late int endTime = widget.fixture.fixture.timestamp * 1000;
  late CountdownTimerController controller;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.shrinkOffset < 100
          ? 70
          : max(70 - widget.shrinkOffset + 100, 50),
      color: Colors.grey[900],
      width: 100,
      child: CountdownTimer(
        endTime: endTime,
        widgetBuilder: (_, time) {
          if (time == null) {
            return const Text('Started');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (time.days == null) Container() else
              Text('Days: ${time.days}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${time.hours}:'),
                  Text('${time.min}:'),
                  Text('${time.sec}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
