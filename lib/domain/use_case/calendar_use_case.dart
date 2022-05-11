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

  DateTime get _focusedDateTime => _state.viewModel.focusedDay;

  CalendarUseCase(final this._repository, final this._state);

  Future<void> reloadState() async {
    _eventHashMap ??= LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    );

    final entries = await _repository.getMonthScheduleEntries(_focusedDateTime);

    final hashMap = LinkedHashMap.fromIterables(
        entries.map((entry) => entry.startDateTime), entries.map((entry) => [entry.title]));

    _eventHashMap!.addAll(hashMap);
    await updateMonthEntries();
  }

  Future<List<Schedule>> getMonthScheduleEntries(final DateTime dateTime) {
    return _repository.getMonthScheduleEntries(dateTime);
  }

  Future<void> updateMonthEntries() async {
    final entries = await getMonthScheduleEntries(_focusedDateTime);

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

  List<String> getEventsForDay(final DateTime day) {
    if (_eventHashMap == null) {
      return [];
    }
    return _eventHashMap![day] ?? [];
  }

  void focusToday() {
    _state.focusToday();
  }

  Future<void> focusMonth(final DateTime dateTime) async {
    _state.focusMonth(dateTime);
    await reloadState();
  }

  void setSelectedDay(final DateTime selectedDay) {
    _state.setCurrentDay(selectedDay);
  }

  int _getHashCode(final DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
