import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';

class ScheduleCreatePresenter {
  final ScheduleCreateUseCase _useCase;
  final CalendarUseCase _calendarUseCase;
  final ScheduleListUseCase _scheduleListUseCase;

  ScheduleCreatePresenter(
    final this._useCase,
    final this._calendarUseCase,
    final this._scheduleListUseCase,
  );

  void setTitle(final String title) {
    _useCase.setTitle(title);
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

  void setWholeDay(final bool isWholeDay) {
    _useCase.setWholeDay(isWholeDay);
  }

  Future<void> save(final WidgetRef ref) async {
    await _useCase.save();
    await _calendarUseCase.reloadState();
    _useCase.refreshState(ref);
    await _scheduleListUseCase.reloadState();
  }

  void refreshState(final WidgetRef ref) {
    _useCase.refreshState(ref);
  }
}
