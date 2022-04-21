import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_football/core/utils/date_utils.dart' as date_utils;
import '../blocs/bloc/fixtures_bloc.dart';

class CalendarListView extends StatefulWidget {
  final int league;
  final int season;

  const CalendarListView({
    Key? key,
    required this.league,
    required this.season,
  }) : super(key: key);

  @override
  State<CalendarListView> createState() => _CalendarListViewState();
}

class _CalendarListViewState extends State<CalendarListView> {
  DateTime currentDateTime = DateTime.now();
  late DateTime calendarDateTime = currentDateTime;
  List<DateTime> currentMonthList = List.empty();
  late ScrollController scrollController;
  late PageController pageViewController;

  @override
  void initState() {
    setMonth(currentDateTime);
    scrollController =
        ScrollController(initialScrollOffset: 73.0 * currentDateTime.day);
    pageViewController = PageController();
    super.initState();
  }

  void setMonth(DateTime dateTime) {
    currentMonthList = date_utils.DateUtils.daysInMonth(calendarDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [_title(), _horizontalCalendar()],
        ));
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  calendarDateTime =
                      calendarDateTime.subtract(Duration(days: 30));
                  setMonth(calendarDateTime);
                });
              },
              icon: Icon(Icons.arrow_back_ios, size: 30,)),
          Expanded(
            child: Center(
              child: Text(
                date_utils.DateUtils
                        .months[calendarDateTime.month - 1] +
                    ' ' +
                    calendarDateTime.year.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, 
                    color: calendarDateTime.day == currentDateTime.day &&
                      calendarDateTime.month == currentDateTime.month &&
                      calendarDateTime.year == currentDateTime.year
                  ? Colors.green
                  : Colors.white,),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  calendarDateTime = calendarDateTime.add(Duration(days: 30));
                  setMonth(calendarDateTime);
                });
              },
              icon: Icon(Icons.arrow_forward_ios, size: 30,))
        ],
      ),
    );
  }

  Widget _horizontalCalendar() {
    return Container(
      height: 80,
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: currentMonthList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _calendarDay(index);
          }),
    );
  }

  Widget _calendarDay(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
            context
                .read<FixturesBloc>()
                .add(FixturesEvent.getFixturesForParameters(
                  league: widget.league,
                  season: widget.season,
                  date: DateFormat('yyyy-MM-dd').format(currentDateTime),
                ));
          });
        },
        child: Container(
          height: 40,
          width: 70,
          decoration: BoxDecoration(
              color: currentMonthList[index].day == currentDateTime.day &&
                      currentMonthList[index].month == currentDateTime.month &&
                      currentMonthList[index].year == currentDateTime.year
                  ? Colors.green
                  : Colors.grey,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                currentMonthList[index].day.toString(),
              ),
              Text(
                date_utils
                    .DateUtils.weekdays[currentMonthList[index].weekday - 1],
              )
            ],
          ),
        ),
      ),
    );
  }
}
