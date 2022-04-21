import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:live_football/core/utils/date_utils.dart' as date_utils;

import '../blocs/bloc/fixtures_bloc.dart';

class CalendarWidget extends StatefulWidget {
  final int league;
  final int season;

  const CalendarWidget({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late PageController _pageViewController;
  late ScrollController _listViewController;

  DateTime currentDateTime = DateTime.now();
  late int currentDay = currentDateTime.day;
  late int currentMonth = currentDateTime.month;
  late int currentYear = currentDateTime.year;
  late int initialPage = currentMonth;

  late DateTime showingDateTime = currentDateTime;

  @override
  void initState() {
    int initialPage;
    if (currentMonth >= 7) {
      initialPage = currentMonth - 7;
    } else {
      initialPage = 5 + currentMonth;
    }

    _pageViewController = PageController(initialPage: initialPage);
    monthsList = date_utils.DateUtils.monthsList(currentDateTime);
    _listViewController =
        ScrollController(initialScrollOffset: currentDay * 68.8);
    super.initState();
  }

  late List<DateTime> monthsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 8),
      child: Container(
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.black),
          child: Stack(
            children: [
              PageView.builder(
                  controller: _pageViewController,
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    DateTime month = monthsList[index];
                    return _page(month);
                  }),
              IconButton(
                  onPressed: () {
                    _pageViewController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  )),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      _pageViewController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceIn);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    )),
              )
            ],
          )),
    );
  }

  Widget _page(DateTime month) {
    List<DateTime> daysOfMonth = date_utils.DateUtils.daysInMonth(month);
    daysOfMonth.sort((a, b) => a.day.compareTo(b.day));
    daysOfMonth = daysOfMonth.toSet().toList();

    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          date_utils.DateUtils.months[month.month - 1] +
              ' ' +
              month.year.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
              controller: _listViewController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: daysOfMonth.length,
              itemBuilder: (context, index) {
                return _day(daysOfMonth[index]);
              }),
        )
      ],
    );
  }

  Widget _day(DateTime day) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (!(day.day == showingDateTime.day &&
              day.month == showingDateTime.month &&
              day.year == showingDateTime.year)) {
            setState(() {
              showingDateTime = day;
              context
                  .read<FixturesBloc>()
                  .add(FixturesEvent.getFixturesForParameters(
                    league: widget.league,
                    season: widget.season,
                    date: DateFormat('yyyy-MM-dd').format(showingDateTime),
                  ));
            });
          }
        },
        child: Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              color: day.day == showingDateTime.day &&
                      day.month == showingDateTime.month &&
                      day.year == showingDateTime.year
                  ? Colors.green
                  : Colors.grey,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day.day.toString(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              Text(
                date_utils.DateUtils.weekdays[day.weekday - 1],
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
