import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';

class ScheduleListState extends StateNotifier<ScheduleListViewModel> {
  ScheduleListState(final ScheduleListViewModel state) : super(state);

  void setDateTime(final DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }
}