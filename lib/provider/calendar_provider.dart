import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/state/calandar_state.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';

final calendarStateProvider = StateNotifierProvider<CalendarState, CalendarViewModel>(
        (ref) => CalendarState(CalendarViewModel(DateTime.now(), DateTime.now())));