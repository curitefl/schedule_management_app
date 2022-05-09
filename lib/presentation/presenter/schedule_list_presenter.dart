import 'package:flutter/material.dart';
import 'package:schedule_management_app/domain/use_case/transition_use_case.dart';

class ScheduleListPresenter {
  final TransitionUseCase _transitionUseCase;

  ScheduleListPresenter(final this._transitionUseCase);

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDateTime) {
    _transitionUseCase.showScheduleCreateView(context, selectedDateTime);
  }
}
