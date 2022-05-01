import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:schedule_management_app/provider/calendar_provider.dart';
import 'package:schedule_management_app/provider/schedule_list_provider.dart';
import 'package:schedule_management_app/view/constants/calendar_constants.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';
import 'package:schedule_management_app/view/view/schedule_list_view.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(calendarStateProvider);
    final state = ref.read(calendarStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextConstants.calendarViewAppBarTitle,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          TableCalendar(
            locale: CalendarConstants.calendarLocale,
            firstDay: CalendarConstants.calendarFirstDay,
            lastDay: CalendarConstants.calendarEndDay,
            focusedDay: viewModel.focusedDay,
            currentDay: viewModel.currentDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: 20.0,
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) {
                return DateFormat(TextConstants.calendarDateFormat).format(date);
              },
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronIcon: const Icon(Icons.arrow_drop_down),
            ),
            calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                )
            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (BuildContext context, DateTime day) {
                final dayOfWeek = DateFormat.E(CalendarConstants.calendarLocale).format(day);
                return Center(
                  child: Text(
                    dayOfWeek,
                    style: TextStyle(
                      color: _textColor(day),
                    ),
                  ),
                );
              },
              defaultBuilder: (BuildContext context, DateTime day, DateTime focusedDay) {
                final date = day.day.toString();
                return Center(
                  child: Text(
                    date,
                    style: TextStyle(
                      color: _textColor(day),
                    ),
                  ),
                );
              },
            ),
            onHeaderTapped: (dateTime) {
              showMonthPicker(context: context, initialDate: DateTime.now()).then(
                (date) {
                  if (date == null) {
                    return;
                  }
                  state.focusMonth(date);
                },
              );
            },
            onDaySelected: (dateTime1, dateTime2){
              state.setCurrentDay(dateTime2);
              ref.read(scheduleListStateProvider.notifier).setDateTime(dateTime2);
              showDialog(
                context: context,
                builder: (builder) {
                  return const ScheduleListView();
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              child: const Text(
                TextConstants.today,
                maxLines: 1,
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                state.focusToday();
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
