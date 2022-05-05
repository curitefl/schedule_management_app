import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';

class CalendarPresenter {
  final CalendarUseCase _calendarUseCase;
  final CalendarState _calendarState;
  final ScheduleListState _scheduleListState;

  CalendarPresenter(this._calendarUseCase, this._calendarState, this._scheduleListState);

  Future refresh() {
    /// TODO 月を直で入れているところを改修する
    return _calendarUseCase.refreshViewModel(5);
  }

  List<String> getEventsForDay(DateTime day) {
    return _calendarUseCase.getEventsForDay(day);
  }

  void focusToday() {
    _calendarState.focusToday();
  }

  void focusMonth(DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }
    _calendarState.focusMonth(dateTime);
  }

  void setCurrentDay(DateTime dateTime) {
    _calendarState.setCurrentDay(dateTime);
    _scheduleListState.setDateTime(dateTime);
  }
}

