import 'dart:ui';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';

class ScheduleCreatePresenter {
  final ScheduleCreateUseCase _scheduleCreateUseCase;
  ScheduleCreatePresenter(this._scheduleCreateUseCase);

  VoidCallback? getSaveCallback() {
    return _scheduleCreateUseCase.getSaveCallback();
  }

  void setTitle(String title) {
    _scheduleCreateUseCase.setTitle(title);
  }

  void setDescription(String description) {
    _scheduleCreateUseCase.setDescription(description);
  }

  void setWholeDay(bool isWholeDay) {
    // TODO 終日スイッチがオフの場合は、オンにする。
    // TODO 終日スイッチがオンの場合は、オフにする。
  }
}