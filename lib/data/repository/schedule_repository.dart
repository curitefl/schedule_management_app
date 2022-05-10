import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';

class ScheduleRepository {
  final CalendarDataStore _calendarDataStore;

  ScheduleRepository(final this._calendarDataStore);

  Future<List<Schedule>> getMonthScheduleEntries(final int year, final int month) {
    return _calendarDataStore.getMonthScheduleEntries(year, month);
  }

  Future<List<Schedule>> getDayScheduleEntries(final int year, final int month, final int day) {
    return _calendarDataStore.getDayScheduleEntries(year, month, day);
  }

  Future addSchedule(
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) {
    return _calendarDataStore.addSchedule(
        title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future updateSchedule(
    final int id,
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    final schedule = await _getSchedule(id);
    return _calendarDataStore.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future deleteSchedule(final int id) async {
    final schedule = await _getSchedule(id);
    return _calendarDataStore.deleteSchedule(schedule);
  }

  Future<Schedule> _getSchedule(final int id) {
    return _calendarDataStore.getScheduleById(id);
  }
}
