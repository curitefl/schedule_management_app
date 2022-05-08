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

  int get _focusedYear => _state.viewModel.focusedDay.year;

  int get _focusedMonth => _state.viewModel.focusedDay.month;

  CalendarUseCase(final this._repository, final this._state);

  Future refreshViewModel() async {
    _eventHashMap ??= LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    );

    final entries = await _repository.getMonthScheduleEntries(_focusedYear, _focusedMonth);

    final hashMap = LinkedHashMap.fromIterables(
        entries.map((entry) => entry.startDateTime), entries.map((entry) => [entry.title]));

    _eventHashMap!.addAll(hashMap);
    await updateMonthEntries();
  }

  Future<List<Schedule>> getMonthScheduleEntries(final int year, final int month) {
    return _repository.getMonthScheduleEntries(year, month);
  }

  Future updateMonthEntries() async {
    final entries = await getMonthScheduleEntries(_focusedYear, _focusedMonth);

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

  Future focusMonth(final DateTime dateTime) async {
    _state.focusMonth(dateTime);
    await refreshViewModel();
  }

  void setSelectedDay(final DateTime selectedDay) {
    _state.setCurrentDay(selectedDay);
  }

  int _getHashCode(final DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}
