import 'package:flutter/material.dart';
import 'package:schedule_management_app/domain/use_case/transition_use_case.dart';

class ScheduleListPresenter {
  final TransitionUseCase _transitionUseCase;

  ScheduleListPresenter(final this._transitionUseCase);

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDateTime) {
    _transitionUseCase.showScheduleCreateView(context, selectedDateTime);
  }

  Future<void> showScheduleEditView(
    final BuildContext context,
    final int scheduleId,
    final DateTime selectedDateTime,
  ) async {
    await _transitionUseCase.showScheduleEditView(context, scheduleId, selectedDateTime);
  }
}
