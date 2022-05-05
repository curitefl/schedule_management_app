import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateState extends StateNotifier<ScheduleCreateViewModel> {
  ScheduleCreateState(state) : super(state);

  void setTitle(String title) {
    state = state.copyWith(title: title);
    _updateCanSave();
  }

  void setWholeDay(bool isWholeDay) {
    state = state.copyWith(isWholeDay: isWholeDay);
  }

  void setStartDateTime(DateTime dateTime) {
    state = state.copyWith(startDateTime: dateTime);
  }

  void setEndDateTime(DateTime dateTime) {
    state = state.copyWith(endDateTime: dateTime);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
    _updateCanSave();
  }

  void _updateCanSave() {
    var canSave = state.title.isNotEmpty && state.description.isNotEmpty;
    state = state.copyWith(canSave: canSave);
  }
}
