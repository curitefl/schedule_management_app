import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';

class ScheduleCreatePresenter {
  final ScheduleCreateUseCase _scheduleCreateUseCase;

  ScheduleCreatePresenter(this._scheduleCreateUseCase);

  VoidCallback? getSaveCallback(BuildContext context, WidgetRef ref) {
    var callback = _scheduleCreateUseCase.getSaveCallback();
    if (callback == null) {
      return null;
    }

    return () {
      callback();
      Navigator.pop(context);
      _scheduleCreateUseCase.refreshState(ref);
    };
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
