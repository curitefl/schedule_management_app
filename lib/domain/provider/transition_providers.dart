import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_edit_providers.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';
import 'package:schedule_management_app/domain/use_case/transition_use_case.dart';

final transitionUseCaseProvider = Provider(
  (ref) => TransitionUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.watch(scheduleListStateProvider.notifier),
    ref.watch(scheduleCreateStateProvider.notifier),
    ref.watch(scheduleEditStateProvider.notifier),
  ),
);
