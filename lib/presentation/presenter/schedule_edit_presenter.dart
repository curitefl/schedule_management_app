import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_edit_use_case.dart';

class ScheduleEditPresenter {
  final ScheduleEditUseCase _useCase;
  final CalendarUseCase _calendarUseCase;

  ScheduleEditPresenter(final this._useCase, final this._calendarUseCase);

  void setTitle(final String title) {
    _useCase.setTitle(title);
  }

  void setWholeDay(final bool isWholeDay) {
    _useCase.setWholeDay(isWholeDay);
  }

  void setStartDateTime(final DateTime startDateTime) {
    _useCase.setStartDateTime(startDateTime);
  }

  void setEndDateTime(final DateTime endDateTime) {
    _useCase.setEndDateTime(endDateTime);
  }

  void setDescription(final String description) {
    _useCase.setDescription(description);
  }

  void save(final WidgetRef ref) async {
    await _useCase.save();
    _calendarUseCase.refreshViewModel();
    _useCase.refreshState(ref);
  }
}