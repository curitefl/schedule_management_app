import 'dart:collection';

import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/calendar_view_model.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_view_model.dart';
import 'package:schedule_management_app/service/database/schedules.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarUseCase {
  final ScheduleRepository _scheduleRepository;
  final CalendarViewModel _calendarViewModel;
  final CalendarState _calendarState;
  LinkedHashMap<DateTime, List<String>>? _eventHashMap;

  CalendarUseCase(this._scheduleRepository, this._calendarViewModel, this._calendarState);

  Future refreshViewModel() async {
    _eventHashMap ??= LinkedHashMap<DateTime, List<String>>(
        equals: isSameDay,
        hashCode: _getHashCode,
      );

    var entries = await _scheduleRepository.getMonthScheduleEntries(_getFocusedMonth());
    var hashMap = LinkedHashMap.fromIterables(
        entries.map((entry) => entry.startDateTime),
        entries.map((entry) => [entry.title]));
    _eventHashMap!.addAll(hashMap);
    await updateMonthEntries();
  }

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    return _scheduleRepository.getMonthScheduleEntries(month);
  }

  Future addSchedule(
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _scheduleRepository.addSchedule(
        title, isWholeDay, startDateTime, endDateTime, description);

    await updateMonthEntries();
    await refreshViewModel();
  }

  Future updateMonthEntries() async {
    var entries = await getMonthScheduleEntries(_getFocusedMonth());
    var modelList = entries
        .map(
          (entry) => ScheduleViewModel(
            id: entry.id,
            title: entry.title,
            isWholeDay: entry.isWholeDay,
            startDateTime: entry.startDateTime,
            endDateTime: entry.endDateTime,
            description: entry.description,
          ),
        )
        .toList();
    _calendarState.updateScheduleViewModel(modelList);
  }

  Future updateSchedule(
    int id,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _scheduleRepository.updateSchedule(
        id, title, isWholeDay, startDateTime, endDateTime, description);
    await updateMonthEntries();
  }

  Future<void> deleteSchedule(int id) async {
    await _scheduleRepository.deleteSchedule(id);
    await updateMonthEntries();
  }


  List<String> getEventsForDay(DateTime day) {
    if(_eventHashMap == null) {
      return [];
    }
    return _eventHashMap![day] ?? [];
  }

  int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  int _getFocusedMonth() {
    return _calendarViewModel.focusedDay.month;
  }
}
