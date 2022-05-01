import 'package:schedule_management_app/service/database/schedules.dart';

class ScheduleRepository {
  final CalendarDatabase _calendarDatabase;

  ScheduleRepository(this._calendarDatabase);

  // TODO drift_sample_view.dartを消すときに消す
  Stream<List<Schedule>> watchEntries() {
    return _calendarDatabase.watchEntries();
  }

  // TODO drift_sample_view.dartを消すときに消す
  Future<List<Schedule>> get allScheduleEntries => _calendarDatabase.allScheduleEntries;

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
      Schedule schedule,
      String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description,
      ) {
    return _calendarDatabase.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> deleteSchedule(Schedule schedule) {
    return _calendarDatabase.deleteSchedule(schedule);
  }
}
