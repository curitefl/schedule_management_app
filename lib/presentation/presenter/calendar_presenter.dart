import 'package:flutter/material.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/transition_use_case.dart';

class CalendarPresenter {
  final CalendarUseCase _useCase;
  final TransitionUseCase _transitionUseCase;

  CalendarPresenter(
    final this._useCase,
    final this._transitionUseCase,
  );

  List<String> getEventsForDay(final DateTime day) {
    return _useCase.getEventsForDay(day);
  }

  void focusToday() {
    _useCase.focusToday();
  }

  Future focusMonth(final DateTime? dateTime) async {
    if (dateTime == null) {
      return;
    }
    await _useCase.focusMonth(dateTime);
  }

  Future showScheduleListView(final BuildContext context, final DateTime selectedDay) async {
    _useCase.setSelectedDay(selectedDay);
    return await _transitionUseCase.showScheduleListView(context, selectedDay);
  }
}
