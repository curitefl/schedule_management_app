import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';

class ScheduleListUseCase {
  final ScheduleCreateState _scheduleCreateState;

  ScheduleListUseCase(this._scheduleCreateState);

  void setSelectedDay(DateTime selectedDay) {
    _scheduleCreateState.setSelectedDay(selectedDay);
  }
}
