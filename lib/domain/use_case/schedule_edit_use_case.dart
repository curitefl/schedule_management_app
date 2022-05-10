import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/domain/provider/schedule_edit_providers.dart';
import 'package:schedule_management_app/presentation/state/schedule_edit_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_edit_view_model.dart';

class ScheduleEditUseCase {
  final ScheduleRepository _repository;
  final ScheduleEditState _state;

  ScheduleEditViewModel get _viewModel => _state.viewModel;

  ScheduleEditUseCase(final this._repository, final this._state);

  void setTitle(final String title) {
    _state.setTitle(title);
  }

  void setWholeDay(final bool isWholeDay) {
    _state.setWholeDay(isWholeDay);
  }

  void setStartDateTime(final DateTime startDateTime) {
    _state.setEndDateTime(startDateTime);
  }

  void setEndDateTime(final DateTime endDateTime) {
    _state.setEndDateTime(endDateTime);
  }

  void setDescription(final String description) {
    _state.setDescription(description);
  }

  Future save() {
    return _repository.updateSchedule(
      _viewModel.scheduleId,
      _viewModel.title,
      _viewModel.isWholeDay,
      _viewModel.startDateTime,
      _viewModel.endDateTime,
      _viewModel.description,
    );
  }

  void refreshState(final WidgetRef ref) {
    ref.refresh(scheduleEditStateProvider);
  }
}