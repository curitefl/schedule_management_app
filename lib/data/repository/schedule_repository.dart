import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';

class ScheduleRepository {
  final CalendarDataStore _calendarDataStore;

  ScheduleRepository(final this._calendarDataStore);

  Future<List<Schedule>> getMonthScheduleEntries(final DateTime dateTime) async {
    return await _calendarDataStore.getMonthScheduleEntries(dateTime);
  }

  Future<List<Schedule>> getDayScheduleEntries(final DateTime dateTime) async {
    return await _calendarDataStore.getDayScheduleEntries(dateTime);
  }

  Future<Schedule> getScheduleEntry(final int scheduleId) async {
    return await _calendarDataStore.getScheduleEntry(scheduleId);
  }

  Future<void> addSchedule(
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    await _calendarDataStore.addSchedule(
        title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> updateSchedule(
    final int scheduleId,
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    final schedule = await getScheduleEntry(scheduleId);

    await _calendarDataStore.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> deleteSchedule(final int scheduleId) async {
    final schedule = await getScheduleEntry(scheduleId);
    await _calendarDataStore.deleteSchedule(schedule);
  }
}
