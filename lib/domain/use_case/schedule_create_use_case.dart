import 'dart:ui';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateUseCase {
  final ScheduleRepository _repository;
  final ScheduleCreateState _scheduleCreateState;

  ScheduleCreateViewModel get _viewModel => _scheduleCreateState.viewModel;

  ScheduleCreateUseCase(final this._repository, final this._scheduleCreateState);

  VoidCallback? getSaveCallback() {
    if (!_viewModel.canSave) {
      return null;
    }
    return _save;
  }

  void setTitle(final String title) {
    _scheduleCreateState.setTitle(title);
  }

  void setDescription(final String description) {
    _scheduleCreateState.setDescription(description);
  }

  void setWholeDay(final bool isWholeDay) {
    _scheduleCreateState.setWholeDay(isWholeDay);
  }

  void refreshState(final WidgetRef ref) {
    ref.refresh(scheduleCreateStateProvider);
  }

  Future _save() async {
    await _repository.addSchedule(
      _viewModel.title,
      _viewModel.isWholeDay,
      _viewModel.startDateTime,
      _viewModel.endDateTime,
      _viewModel.description,
    );
  }
}
