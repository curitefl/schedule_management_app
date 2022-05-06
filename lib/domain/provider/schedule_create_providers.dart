import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_create_presenter.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

final scheduleCreateViewModelProvider = Provider(
  (ref) {
    var now = DateTime.now();
    return ScheduleCreateViewModel(
      selectedDay: now,
      title: '',
      isWholeDay: false,
      startDateTime: now,
      endDateTime: now,
      description: '',
      canSave: false,
      isModified: false,
    );
  },
);

final scheduleCreateStateProvider =
    StateNotifierProvider<ScheduleCreateState, ScheduleCreateViewModel>(
  (ref) => ScheduleCreateState(
    ref.watch(scheduleCreateViewModelProvider),
  ),
);

final scheduleCreateUseCaseProvider = Provider(
  (ref) => ScheduleCreateUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.read(scheduleCreateStateProvider.notifier),
    ref.read(calendarStateProvider.notifier),
  ),
);

final scheduleCreatePresenterProvider = Provider(
  (ref) => ScheduleCreatePresenter(
    ref.watch(scheduleCreateUseCaseProvider),
  ),
);
