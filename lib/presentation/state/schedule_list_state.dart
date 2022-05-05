import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';

class ScheduleListState extends StateNotifier<ScheduleListViewModel> {
  ScheduleListState(ScheduleListViewModel state) : super(state);

  void setDateTime(DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }
}