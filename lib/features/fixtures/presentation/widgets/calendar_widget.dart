import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_football/core/utils/date_utils.dart' as date_utils;
import '../blocs/bloc/fixtures_bloc.dart';

class CalendarWidget extends StatefulWidget {
  final int league;

  const CalendarWidget({
    Key? key,
    required this.league,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late PageController _pageViewController;
  late ScrollController _listViewController;

  DateTime currentDateTime = DateTime.now();
  late DateTime showingMonth = currentDateTime;
  late DateTime nextMonth =
      DateTime(currentDateTime.year, currentDateTime.month + 1);
  late DateTime previousMonth =
      DateTime(currentDateTime.year, currentDateTime.month - 1);
  late DateTime chosenDay = currentDateTime;
  late List<DateTime> monthsList;

  @override
  void initState() {
    _pageViewController = PageController(initialPage: 1);
    monthsList = date_utils.DateUtils.monthsList(currentDateTime);
    _listViewController = ScrollController(
        initialScrollOffset: currentDateTime.day * _dayOffset - _dayOffset);
    super.initState();
  }

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
                  itemCount: monthsList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    DateTime month = monthsList[index];
                    return _page(month);
                  }),
              IconButton(
                  onPressed: () async {
                    if (_pageViewController.page!.toInt() == 0) {
                      setState(() {
                        previousMonth = DateTime(
                            previousMonth.year, previousMonth.month - 1);
                        monthsList.insert(0, previousMonth);
                        _pageViewController
                            .jumpToPage(_pageViewController.page!.toInt() + 1);
                      });
                    }
                    await _pageViewController.previousPage(
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
                    onPressed: () async {
                      await _pageViewController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceIn);
                      if (_pageViewController.page!.toInt() ==
                          monthsList.length - 1) {
                        setState(() {
                          nextMonth =
                              DateTime(nextMonth.year, nextMonth.month + 1);
                          monthsList.add(nextMonth);
                        });
                      }
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

  final double _dayWidth = 60;
  final double _dayPadding = 8;
  late final double _dayOffset = _dayWidth + 2 * _dayPadding;

  Widget _day(DateTime day) {
    return Padding(
      padding: EdgeInsets.all(_dayPadding),
      child: InkWell(
        onTap: () {
          if (!(day.day == showingMonth.day &&
              day.month == showingMonth.month &&
              day.year == showingMonth.year)) {
            setState(() {
              chosenDay = day;
              context
                  .read<FixturesBloc>()
                  .add(FixturesEvent.getFixturesForParameters(
                    league: widget.league,
                    season: date_utils.DateUtils.seasonYear(chosenDay),
                    date: DateFormat('yyyy-MM-dd').format(chosenDay),
                  ));
            });
          }
        },
        child: Container(
          height: 40,
          width: _dayWidth,
          decoration: BoxDecoration(
              color: day.day == chosenDay.day &&
                      day.month == chosenDay.month &&
                      day.year == chosenDay.year
                  ? Colors.green
                  : Colors.grey,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day.day.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
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
