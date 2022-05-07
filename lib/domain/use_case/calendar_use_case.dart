import 'dart:collection';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_view_model.dart';
import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarUseCase {
  final ScheduleRepository _repository;
  final CalendarState _state;
  LinkedHashMap<DateTime, List<String>>? _eventHashMap;

  int get _focusedMonth => _state.viewModel.focusedDay.month;

  CalendarUseCase(final this._repository, final this._state);

  Future refreshViewModel() async {
    _eventHashMap ??= LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    );

    final entries = await _repository.getMonthScheduleEntries(_focusedMonth);

    final hashMap = LinkedHashMap.fromIterables(
        entries.map((entry) => entry.startDateTime), entries.map((entry) => [entry.title]));

    _eventHashMap!.addAll(hashMap);
    await updateMonthEntries();
  }

  Future<List<Schedule>> getMonthScheduleEntries(final int month) {
    return _repository.getMonthScheduleEntries(month);
  }

  Future addSchedule(
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    await _repository.addSchedule(title, isWholeDay, startDateTime, endDateTime, description);
    await updateMonthEntries();
    await refreshViewModel();
  }

  Future updateMonthEntries() async {
    final entries = await getMonthScheduleEntries(_focusedMonth);

    final modelList = entries
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
    _state.updateScheduleViewModel(modelList);
  }

  Future updateSchedule(
    int id,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _repository.updateSchedule(
      id,
      title,
      isWholeDay,
      startDateTime,
      endDateTime,
      description,
    );

    await updateMonthEntries();
  }

  Future deleteSchedule(final int id) async {
    await _repository.deleteSchedule(id);
    await updateMonthEntries();
  }

  List<String> getEventsForDay(final DateTime day) {
    if (_eventHashMap == null) {
      return [];
    }
    return _eventHashMap![day] ?? [];
  }

  int _getHashCode(final DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
