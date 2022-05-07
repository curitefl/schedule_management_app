import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/domain/provider/repository_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/calendar_presenter.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/calendar_view_model.dart';

final scheduleRepositoryProvider = Provider(
  (ref) => ScheduleRepository(
    ref.watch(calendarDataStoreProvider),
  ),
);

final calendarUseCaseProvider = Provider(
  (ref) => CalendarUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.watch(calendarStateProvider.notifier),
  ),
);

final calendarStateProvider = StateNotifierProvider<CalendarState, CalendarViewModel>(
  (ref) => CalendarState(
    CalendarViewModel(
      focusedDay: DateTime.now(),
      currentDay: DateTime.now(),
      scheduleViewModelList: [],
    ),
  ),
);

final calendarPresenterProvider = Provider(
  (ref) => CalendarPresenter(
    ref.watch(calendarUseCaseProvider),
    ref.watch(calendarStateProvider.notifier),
    ref.watch(scheduleListStateProvider.notifier),
  ),
);
