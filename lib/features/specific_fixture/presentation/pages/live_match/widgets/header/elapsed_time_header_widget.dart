import 'package:flutter/material.dart';
import '../../../../../domain/entities/fixture.dart';
import '../../../../widgets/gradient_text.dart';
import '../../../../widgets/text_opacity.dart';

class ElapsedTimeWidget extends StatefulWidget {
  final Status status;
  final double shrinkOffset;
  const ElapsedTimeWidget(
      {Key? key, required this.status, required this.shrinkOffset})
      : super(key: key);

  @override
  State<ElapsedTimeWidget> createState() => _ElapsedTimeWidgetState();
}

class _ElapsedTimeWidgetState extends State<ElapsedTimeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<Color> colorList = [Colors.white, Colors.green, Colors.green];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.green;
  Color topColor = Colors.white;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  late Animation<Color?> animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    setState(() {
      bottomColor = colorList[index % colorList.length];
      topColor = colorList[(index + 1) % colorList.length];
    });

    animation = ColorTween(
      begin: bottomColor,
      end: topColor,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.shrinkOffset < 80 ) {
      return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GradientText(
          widget.status.elapsed.toString() + "'",
          gradient: LinearGradient(
              begin: begin, end: end, colors: [animation.value!.withOpacity(TextOpacity.titleOpacity(widget.shrinkOffset)), topColor.withOpacity(TextOpacity.titleOpacity(widget.shrinkOffset))]),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
    } else {
      return Container();
    }
    
  }
}