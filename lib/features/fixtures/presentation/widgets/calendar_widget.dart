import 'package:flutter/material.dart';
import 'package:live_football/core/utils/date_utils.dart' as date_utils;

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController(initialPage: currentMonth);
    setDaysOfMonth(currentDateTime);
    super.initState();
  }

  DateTime currentDateTime = DateTime.now();
  late int currentDay = currentDateTime.day;
  late int currentMonth = currentDateTime.month;
  late int currentYear = currentDateTime.year;

  late DateTime showingDateTime;

  List<DateTime> daysOfMonth = List.empty();

  void setDaysOfMonth(DateTime dateTime) {
    showingDateTime = dateTime;
    daysOfMonth = date_utils.DateUtils.daysInMonth(dateTime);
    daysOfMonth.sort((a, b) => a.day.compareTo(b.day));
    daysOfMonth = daysOfMonth.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(showingDateTime.year.toString()),
        Container(
          height: 100,
          child: PageView.builder(
              controller: _pageViewController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        height: 40,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (index != 1) {
                                    _pageViewController.previousPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.bounceIn);
                                  } else {
                                    _pageViewController.jumpToPage(12);
                                    setState(() {
                                      showingDateTime =
                                          DateTime(showingDateTime.year - 1);
                                    });
                                  }
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                            Expanded(
                              child: Center(
                                child: Text(
                                    date_utils.DateUtils.months[index - 1]),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  if (index != 12) {
                                    _pageViewController.nextPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.bounceIn);
                                    showingDateTime = DateTime(
                                        showingDateTime.year,
                                        showingDateTime.month + 1);
                                    setState(() {
                                      setDaysOfMonth(showingDateTime);
                                    });
                                  } else {
                                    _pageViewController.jumpToPage(1);
                                    setState(() {
                                      showingDateTime =
                                          DateTime(showingDateTime.year + 1);
                                      setDaysOfMonth(showingDateTime);
                                    });
                                  }
                                },
                                icon: Icon(Icons.arrow_forward_ios))
                          ],
                        )),
                    Container(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: daysOfMonth.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(daysOfMonth[index].day.toString()),
                                  Text(daysOfMonth[index].weekday.toString()),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }
}