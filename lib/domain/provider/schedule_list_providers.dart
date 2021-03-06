import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/calendar_providers.dart';
import 'package:schedule_management_app/domain/provider/transition_providers.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_list_presenter.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_view_model.dart';

final scheduleListStateProvider = StateNotifierProvider<ScheduleListState, ScheduleListViewModel>(
  (ref) => ScheduleListState(
    ScheduleListViewModel(
      selectedDateTime: DateTime.now(),
      selectedDateTimeText: '',
      weekDayText: '',
      weekDayColor: Colors.black,
      scheduleElements: [],
    ),
  ),
);

final scheduleListUseCaseProvider = Provider(
  (ref) => ScheduleListUseCase(
    ref.watch(scheduleRepositoryProvider),
    ref.watch(scheduleListStateProvider.notifier),
  ),
);

final scheduleListPresenterProvider = Provider(
  (ref) => ScheduleListPresenter(
    ref.watch(transitionUseCaseProvider),
  ),
);
