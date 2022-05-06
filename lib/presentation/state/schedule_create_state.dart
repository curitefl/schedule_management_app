import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateState extends StateNotifier<ScheduleCreateViewModel> {
  ScheduleCreateState(ScheduleCreateViewModel state) : super(state);

  void setSelectedDay(DateTime dateTime) {
    state = state.copyWith(
      selectedDay: dateTime,
      startDateTime: dateTime,
      endDateTime: dateTime.add(const Duration(hours: 1)),
    );
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
    _updateCanSave();
    _updateIsModified();
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
    _updateIsModified();
  }

  void _updateCanSave() {
    var canSave = state.title.isNotEmpty && state.description.isNotEmpty;
    state = state.copyWith(canSave: canSave);
  }

  void _updateIsModified() {
    var isModified = state.title.isNotEmpty || state.description.isNotEmpty;
    state = state.copyWith(isModified: isModified);
  }
}
