import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';
import 'package:schedule_management_app/domain/use_case/schedule_edit_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_edit_presenter.dart';
import 'package:schedule_management_app/presentation/state/schedule_edit_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_edit_view_model.dart';

final scheduleEditStateProvider = StateNotifierProvider<ScheduleEditState, ScheduleEditViewModel>(
  (ref) {
    final now = DateTime.now();

    return ScheduleEditState(
      ScheduleEditViewModel(
        scheduleId: 0,
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

final scheduleEditUseCaseProvider = Provider(
  (ref) => ScheduleEditUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.watch(scheduleEditStateProvider.notifier),
  ),
);

final scheduleEditPresenterProvider = Provider(
  (ref) => ScheduleEditPresenter(
    ref.watch(scheduleEditUseCaseProvider),
    ref.watch(calendarUseCaseProvider),
    ref.watch(scheduleListUseCaseProvider),
  ),
);
