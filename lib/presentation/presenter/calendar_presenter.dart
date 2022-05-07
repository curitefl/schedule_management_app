import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';

class CalendarPresenter {
  final CalendarUseCase _useCase;
  final CalendarState _calendarState;
  final ScheduleListState _scheduleListState;

  CalendarPresenter(final this._useCase, final this._calendarState, final this._scheduleListState);

  Future refresh() {
    return _useCase.refreshViewModel();
  }

  List<String> getEventsForDay(final DateTime day) {
    return _useCase.getEventsForDay(day);
  }

  void focusToday() {
    _calendarState.focusToday();
  }

  void focusMonth(final DateTime? dateTime) {
    if (dateTime == null) {
      return;
    }
    _calendarState.focusMonth(dateTime);
    _useCase.refreshViewModel();
  }

  void setCurrentDay(final DateTime dateTime) {
    _calendarState.setCurrentDay(dateTime);
    _scheduleListState.setDateTime(dateTime);
  }
}
