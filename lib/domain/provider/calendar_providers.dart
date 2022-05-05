import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/domain/provider/repository_providers.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/state/calandar_state.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';

final scheduleRepositoryProvider = Provider(
  (ref) => ScheduleRepository(
    ref.watch(calendarDataBaseProvider),
  ),
);

final calendarUseCaseProvider = Provider(
  (ref) {
    return CalendarUseCase(
      ref.watch(scheduleRepositoryProvider),
      ref.read(calendarStateProvider.notifier),
    );
  },
);

final calendarViewModelProvider = Provider(
  (ref) => CalendarViewModel(
    focusedDay: DateTime.now(),
    currentDay: DateTime.now(),
    scheduleViewModelList: [],
  ),
);

final calendarStateProvider = StateNotifierProvider<CalendarState, CalendarViewModel>(
  (ref) => CalendarState(
    ref.watch(calendarViewModelProvider),
  ),
);
