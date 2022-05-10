import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_create_presenter.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

final scheduleCreateStateProvider =
    StateNotifierProvider<ScheduleCreateState, ScheduleCreateViewModel>(
  (ref) {
    final now = DateTime.now();

    return ScheduleCreateState(
      ScheduleCreateViewModel(
        maximumYear: now.year + 100,
        selectedDateTime: now,
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

final scheduleCreateUseCaseProvider = Provider(
  (ref) => ScheduleCreateUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.watch(scheduleCreateStateProvider.notifier),
  ),
);

final scheduleCreatePresenterProvider = Provider(
  (ref) => ScheduleCreatePresenter(
    ref.watch(scheduleCreateStateProvider.notifier),
    ref.watch(scheduleCreateUseCaseProvider),
    ref.watch(calendarUseCaseProvider),
    ref.watch(scheduleListUseCaseProvider),
  ),
);
