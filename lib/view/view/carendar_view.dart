import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 20.0,
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronIcon: Icon(Icons.arrow_drop_down),
            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (BuildContext context, DateTime day) {
                if (day.weekday == DateTime.sunday) {
                  final text = DateFormat.E(CalendarConstants.calendarLocale).format(day);

                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: _textColor(day),
                      ),
                    ),
                  );
                }
              },
              defaultBuilder: (BuildContext context, DateTime day, DateTime focusedDay) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    day.day.toString(),
                    style: TextStyle(
                      color: _textColor(day),
                    ),
                  ),
                );
              },
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

Color _textColor(DateTime day) {
  const _defaultTextColor = Colors.black87;

  if (day.weekday == DateTime.sunday) {
    return Colors.red;
  }
  if (day.weekday == DateTime.saturday) {
    return Colors.blue[600]!;
  }
  return _defaultTextColor;
}
