import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/provider/calendar_view_model_provider.dart';
import 'package:schedule_management_app/state/calandar_state.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';

final calendarStateProvider = StateNotifierProvider<CalendarState, CalendarViewModel>(
        (ref) => CalendarState(ref.watch(calendarViewModelProvider)));
