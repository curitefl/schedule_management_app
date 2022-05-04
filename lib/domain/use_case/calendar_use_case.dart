import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/service/database/schedules.dart';
import 'package:schedule_management_app/state/calandar_state.dart';
import 'package:schedule_management_app/view/view_model/schedule_view_model.dart';

class CalendarUseCase {
  final ScheduleRepository _scheduleRepository;
  final CalendarState _calendarState;

  CalendarUseCase(this._scheduleRepository, this._calendarState);

  Future refreshViewModel(int focusedMonth) async {
    await updateMonthEntries(focusedMonth);
  }

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    return _scheduleRepository.getMonthScheduleEntries(month);
  }

  Future addSchedule(
    int focusedMonth,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _scheduleRepository.addSchedule(
        title, isWholeDay, startDateTime, endDateTime, description);

    await updateMonthEntries(focusedMonth);
  }

  Future updateMonthEntries(int focusedMonth) async {
    var entries = await getMonthScheduleEntries(focusedMonth);
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
    int focusedMonth,
    int id,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _scheduleRepository.updateSchedule(
        id, title, isWholeDay, startDateTime, endDateTime, description);
    await updateMonthEntries(focusedMonth);
  }

  Future<void> deleteSchedule(int focusedMonth, int id) async {
    await _scheduleRepository.deleteSchedule(id);
    await updateMonthEntries(focusedMonth);
  }
}
