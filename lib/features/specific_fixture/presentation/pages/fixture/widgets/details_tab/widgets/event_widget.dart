import 'package:flutter/material.dart';
import '../../../../../../domain/entities/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  final bool isHome;

  EventWidget({
    Key? key,
    required this.event,
    required this.isHome,
  }) : super(key: key);

  late List<Widget> eventRow = [
    SizedBox(
        width: 20,
        child: Center(child: Text(event.time.elapsed.toString() + "'"))),
    const SizedBox(
      width: 10,
    ),
    event.icon!,
    const SizedBox(
      width: 10,
    ),
    Text(
      event.player.name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      width: 10,
    ),
    Text(
      event.assist.name != null ? "(${event.assist.name})" : '',
      style: const TextStyle(color: Colors.grey),
    ),
  ];

  late List<Widget> subsRow = [
    SizedBox(
        width: 20,
        child: Center(child: Text(event.time.elapsed.toString() + "'"))),
    const SizedBox(
      width: 10,
    ),
    event.icon!,
    const SizedBox(
      width: 10,
    ),
    Column(
      children: [
        Text(
          event.assist.name!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(event.player.name,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
            isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: event.detail.contains('Substitution')
            ? (isHome ? subsRow : subsRow.reversed.toList())
            : (isHome ? eventRow : eventRow.reversed.toList()),
      ),
    );
  }
}
