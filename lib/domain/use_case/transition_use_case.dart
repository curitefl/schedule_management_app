import 'package:flutter/material.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_edit_state.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_create_view.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_edit_view.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_list_view.dart';

class TransitionUseCase {
  final ScheduleRepository _repository;
  final ScheduleCreateState _scheduleCreateState;
  final ScheduleEditState _scheduleEditState;

  TransitionUseCase(
    final this._repository,
    final this._scheduleCreateState,
    final this._scheduleEditState,
  );

  Future showScheduleListView(final BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => const ScheduleListView(),
    );
  }

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDateTime) {
    _scheduleCreateState.setSelectedDay(selectedDateTime);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ScheduleCreateView(),
      ),
    );
  }

  void showScheduleEditView(final BuildContext context, final int scheduleId, final DateTime selectedDateTime) async {
    final schedule = await _repository.getScheduleEntry(scheduleId);

    _scheduleEditState.set(
      schedule.id,
      schedule.title,
      schedule.isWholeDay,
      schedule.startDateTime,
      schedule.endDateTime,
      schedule.description,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ScheduleEditView(),
      ),
    );
  }
}
