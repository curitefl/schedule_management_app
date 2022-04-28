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
      body: Stack(
        children: [
          TableCalendar(
            locale: CalendarConstants.calendarLocale,
            firstDay: CalendarConstants.calendarFirstDay,
            lastDay: CalendarConstants.calendarEndDay,
            focusedDay: DateTime.now(),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronIcon: Icon(Icons.arrow_drop_down),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              child: const Text(TextConstants.today),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                // TODO 今日にフォーカスする
              },
            ),
          ),
        ],
      ),
    );
  }
}
