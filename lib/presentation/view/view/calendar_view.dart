import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/presentation/view/constants/calendar_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final viewModel = ref.watch(calendarStateProvider);
    final presenter = ref.watch(calendarPresenterProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          TextConstants.calendarViewAppBarTitle,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              TableCalendar(
                  eventLoader: presenter.getEventsForDay,
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
                    ),
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
                  onHeaderTapped: (_) {
                    showMonthPicker(context: context, initialDate: viewModel.focusedDay).then(
                      (date) async {
                        await presenter.focusMonth(date);
                      },
                    );
                  },
                  onDaySelected: (selectedDay, focusedDay) async {
                    await presenter.showScheduleListView(context, selectedDay);
                  },
                  onPageChanged: (dateTime) async {
                    await presenter.focusMonth(dateTime);
                  }),
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
                    presenter.focusToday();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _textColor(final DateTime day) {
    const _defaultTextColor = Colors.black87;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue[600]!;
    }
    return _defaultTextColor;
  }
}
