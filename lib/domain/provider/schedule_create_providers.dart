import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_create_presenter.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

final scheduleCreateViewModelProvider = Provider(
  (ref) => ScheduleCreateViewModel(
    title: '',
    isWholeDay: false,
    startDateTime: DateTime.now(),
    endDateTime: DateTime.now(),
    description: '',
    canSave: false,
    isModified: false,
  ),
);

final scheduleCreateStateProvider =
    StateNotifierProvider<ScheduleCreateState, ScheduleCreateViewModel>(
  (ref) => ScheduleCreateState(
    ref.watch(scheduleCreateViewModelProvider),
  ),
);

final scheduleCreateUseCaseProvider = Provider(
  (ref) => ScheduleCreateUseCase(
    ref.watch(scheduleCreateStateProvider),
    ref.read(scheduleCreateStateProvider.notifier),
  ),
);

final scheduleCreatePresenterProvider = Provider(
  (ref) => ScheduleCreatePresenter(
    ref.watch(scheduleCreateUseCaseProvider),
  ),
);
