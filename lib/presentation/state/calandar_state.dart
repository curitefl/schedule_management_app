import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/calendar_view_model.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_view_model.dart';

class CalendarState extends StateNotifier<CalendarViewModel> {
  CalendarState(final CalendarViewModel state) : super(state);

  CalendarViewModel get viewModel => state;

  void focusToday() {
    final now = DateTime.now();
    state = state.copyWith(focusedDay: now, currentDay: now);
  }

  void focusMonth(final DateTime dateTime) {
    state = state.copyWith(focusedDay: dateTime);
  }

  void setCurrentDay(final DateTime dateTime) {
    state = state.copyWith(focusedDay: dateTime, currentDay: dateTime);
  }

  void updateScheduleViewModel(final List<ScheduleViewModel> modelList) {
    state = state.copyWith(scheduleViewModelList: modelList);
  }
}
