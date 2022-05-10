import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_edit_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';

class ScheduleEditPresenter {
  final ScheduleEditUseCase _useCase;
  final CalendarUseCase _calendarUseCase;
  final ScheduleListUseCase _scheduleListUseCase;

  ScheduleEditPresenter(
    final this._useCase,
    final this._calendarUseCase,
    final this._scheduleListUseCase,
  );

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

  Future<void> save(final WidgetRef ref) async {
    await _useCase.save();
    await _scheduleListUseCase.reloadState();
    await _calendarUseCase.reloadState();
  }
}
