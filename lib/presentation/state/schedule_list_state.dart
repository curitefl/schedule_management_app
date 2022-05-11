import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';

class ScheduleListState extends StateNotifier<ScheduleListViewModel> {
  ScheduleListState(final ScheduleListViewModel state) : super(state);

  ScheduleListViewModel get viewModel => state;

  void setSelectedDay(final DateTime selectedDateTime) {
    final selectedDateTimeText = DateFormat(
      ScheduleListConstants.dateTimeFormat,
      ScheduleListConstants.scheduleListLocale,
    ).format(selectedDateTime);

    final weekDayText = DateFormat(
      ScheduleListConstants.dateTimeWeekDayFormat,
      ScheduleListConstants.scheduleListLocale,
    ).format(selectedDateTime);

    final weekDayColor = _getWeekDayColor(selectedDateTime);

    state = state.copyWith(
      selectedDateTime: selectedDateTime,
      selectedDateTimeText: selectedDateTimeText,
      weekDayText: weekDayText,
      weekDayColor: weekDayColor,
    );
  }

  void setScheduleElements(final List<ScheduleListElementModel> scheduleElements) {
    state = state.copyWith(scheduleElements: scheduleElements);
  }

  Color _getWeekDayColor(DateTime dateTime) {
    switch (dateTime.weekday) {
      case DateTime.saturday:
        return Colors.blue;
      case DateTime.sunday:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
