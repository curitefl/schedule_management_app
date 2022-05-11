import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateUseCase {
  final ScheduleRepository _repository;
  final ScheduleCreateState _state;

  ScheduleCreateViewModel get _viewModel => _state.viewModel;

  ScheduleCreateUseCase(final this._repository, final this._state);

  void setTitle(final String title) {
    _state.setTitle(title);
  }

  void setStartDateTime(final DateTime startDateTime) {
    _state.setStartDateTime(startDateTime);
  }

  void setEndDateTime(final DateTime endDateTime) {
    _state.setEndDateTime(endDateTime);
  }

  void setDescription(final String description) {
    _state.setDescription(description);
  }

  void setWholeDay(final bool isWholeDay) {
    _state.setWholeDay(isWholeDay);
  }

  void refreshState(final WidgetRef ref) {
    ref.refresh(scheduleCreateStateProvider);
  }

  Future<void> save() {
    return _repository.addSchedule(
      _viewModel.title,
      _viewModel.isWholeDay,
      _viewModel.startDateTime,
      _viewModel.endDateTime,
      _viewModel.description,
    );
  }
}
