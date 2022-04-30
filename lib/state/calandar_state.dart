import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';

class CalendarState extends StateNotifier<CalendarViewModel> {
  CalendarState(state) : super(state);

  void focusToday() {
    state.focusToday();
    state = state.copy();
  }

  void focusMonth(DateTime dateTime) {
    state.focusMonth(dateTime);
    state = state.copy();
  }
}