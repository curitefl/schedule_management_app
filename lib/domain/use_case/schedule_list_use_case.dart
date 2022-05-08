import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';

class ScheduleListUseCase {
  final ScheduleRepository _repository;
  final ScheduleListState _state;
  final ScheduleCreateState _scheduleCreateState;

  DateTime get _selectedDay => _state.viewModel.selectedDay;

  ScheduleListUseCase(final this._repository, final this._state, final this._scheduleCreateState);

  void setSelectedDay(final DateTime selectedDay) {
    _scheduleCreateState.setSelectedDay(selectedDay);
  }

  Future refreshViewModel() async {
    final entries = await _repository.getDayScheduleEntries(
        _selectedDay.year, _selectedDay.month, _selectedDay.day);

    var scheduleElements = entries
        .map((entry) => ScheduleListElementModel(
              isWholeDay: entry.isWholeDay,
              startDateTime: entry.startDateTime,
              endDateTime: entry.endDateTime,
              scheduleTitle: entry.title,
            ))
        .toList();

    _state.setScheduleElements(scheduleElements);
  }
}
