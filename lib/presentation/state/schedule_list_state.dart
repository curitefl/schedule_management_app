import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';

class ScheduleListState extends StateNotifier<ScheduleListViewModel> {
  ScheduleListState(final ScheduleListViewModel state) : super(state);
  ScheduleListViewModel get viewModel => state;

  void setSelectedDay(final DateTime selectedDay) {
    state = state.copyWith(selectedDay: selectedDay);
  }

  void setScheduleElements(final List<ScheduleListElementModel> scheduleElements) {
    state = state.copyWith(scheduleElements: scheduleElements);
  }
}
