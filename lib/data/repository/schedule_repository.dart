import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';

class ScheduleRepository {
  final CalendarDataStore _calendarDataStore;

  ScheduleRepository(this._calendarDataStore);

  Future<Schedule> getSchedule(int id) {
    return _calendarDataStore.getScheduleById(id);
  }

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    return _calendarDataStore.getMonthScheduleEntries(month);
  }

  Future addSchedule(
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) {
    return _calendarDataStore.addSchedule(
        title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future updateSchedule(
      int id,
      String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description,
      ) async {
    var schedule = await getSchedule(id);
    return _calendarDataStore.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> deleteSchedule(int id) async {
    var schedule = await getSchedule(id);
    return _calendarDataStore.deleteSchedule(schedule);
  }
}
