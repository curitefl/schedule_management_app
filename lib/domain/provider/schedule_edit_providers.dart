import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/state/schedule_edit_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_edit_view_model.dart';

final scheduleEditStateProvider =
StateNotifierProvider<ScheduleEditState, ScheduleEditViewModel>(
      (ref) {
    final now = DateTime.now();

    return ScheduleEditState(
      ScheduleEditViewModel(
        maximumYear: now.year + 100,
        title: '',
        isWholeDay: false,
        startDateTime: now,
        endDateTime: now,
        startDateTimeText: '',
        endDateTimeText: '',
        description: '',
        canSave: false,
        isModified: false,
      ),
    );
  },
);