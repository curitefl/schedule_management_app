import 'package:flutter/material.dart';
import 'package:schedule_management_app/view/constants/calendar_constants.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.calendarViewAppBarTitle),
        centerTitle: true,
      ),
      body: TableCalendar(
        firstDay: CalendarConstants.calendarFirstDay,
        lastDay: CalendarConstants.calendarEndDay,
        focusedDay: DateTime.now(),
      ),
    );
  }
}
