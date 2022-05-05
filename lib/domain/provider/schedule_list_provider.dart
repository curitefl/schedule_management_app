import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';
import 'package:schedule_management_app/state/schedule_list_state.dart';

final scheduleListStateProvider = StateNotifierProvider<ScheduleListState, ScheduleListViewModel>(
    (ref) => ScheduleListState(const ScheduleListViewModel()));