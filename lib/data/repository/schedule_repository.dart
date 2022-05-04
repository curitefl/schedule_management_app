import 'package:schedule_management_app/service/database/schedules.dart';

class ScheduleRepository {
  final CalendarDatabase _calendarDatabase;

  ScheduleRepository(this._calendarDatabase);

  Future<Schedule> getSchedule(int id) {
    return _calendarDatabase.getScheduleById(id);
  }

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    return _calendarDatabase.getMonthScheduleEntries(month);
  }

  Future addSchedule(
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) {
    return _calendarDatabase.addSchedule(
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
    return _calendarDatabase.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> deleteSchedule(int id) async {
    var schedule = await getSchedule(id);
    return _calendarDatabase.deleteSchedule(schedule);
  }
}
