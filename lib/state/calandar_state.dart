import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';
import 'package:schedule_management_app/view/view_model/schedule_view_model.dart';

class CalendarState extends StateNotifier<CalendarViewModel> {
  CalendarState(state) : super(state);

  void focusToday() {
    var now = DateTime.now();
    state = state.copyWith(focusedDay: now, currentDay: now);
  }

  void focusMonth(DateTime dateTime) {
    state = state.copyWith(focusedDay: dateTime);
  }

  void setCurrentDay(DateTime dateTime) {
    state = state.copyWith(focusedDay: dateTime, currentDay: dateTime);
}

  void updateScheduleViewModel(List<ScheduleViewModel> modelList) {
    state = state.copyWith(scheduleViewModelList: modelList);
  }
}
