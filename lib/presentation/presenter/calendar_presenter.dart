import 'package:flutter/material.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_list_view.dart';

class CalendarPresenter {
  final CalendarUseCase _useCase;
  final ScheduleListUseCase _scheduleListUseCase;
  final CalendarState _calendarState;
  final ScheduleListState _scheduleListState;

  CalendarPresenter(
    final this._useCase,
    final this._scheduleListUseCase,
    final this._calendarState,
    final this._scheduleListState,
  );

  Future refresh() {
    return _useCase.refreshViewModel();
  }

  List<String> getEventsForDay(final DateTime day) {
    return _useCase.getEventsForDay(day);
  }

  void focusToday() {
    _calendarState.focusToday();
  }

  void focusMonth(final DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }
    _useCase.focusMonth(dateTime);
    _useCase.refreshViewModel();
  }

  Future showScheduleListView(final BuildContext context, final DateTime selectedDay) {
    _calendarState.setCurrentDay(selectedDay);
    _scheduleListState.setSelectedDay(selectedDay);
    _scheduleListUseCase.refreshViewModel();

    return showDialog(
      context: context,
      builder: (builder) {
        return const ScheduleListView();
      },
    ).then((value) => refresh());
  }
}
