import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/service/database/schedules.dart';

class CalendarUseCase {
  final ScheduleRepository _scheduleRepository;

  CalendarUseCase(this._scheduleRepository);

  // TODO drift_sample_view.dartを消すときに消す
  Stream<List<Schedule>> watchEntries() {
    return _scheduleRepository.watchEntries();
  }

  // TODO drift_sample_view.dartを消すときに消す
  Future<List<Schedule>> get allScheduleEntries => _scheduleRepository.allScheduleEntries;

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    return _scheduleRepository.getMonthScheduleEntries(month);
  }

  Future addSchedule(
      String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description,
      ) {
    return _scheduleRepository.addSchedule(
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
    return _scheduleRepository.updateSchedule(
        schedule, title, isWholeDay, startDateTime, endDateTime, description);
  }

  Future<void> deleteSchedule(Schedule schedule) {
    return _scheduleRepository.deleteSchedule(schedule);
  }
}