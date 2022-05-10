import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleCreatePresenter {
  final ScheduleCreateState _state;
  final ScheduleCreateUseCase _useCase;
  final CalendarUseCase _calendarUseCase;
  final ScheduleListUseCase _scheduleListUseCase;

  ScheduleCreatePresenter(
    final this._state,
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

  void closeView(final BuildContext context, final WidgetRef ref) {
    if (_state.viewModel.isModified) {
      _showModifiedPopup(context, ref);
    } else {
      _popAndRefreshState(context, ref);
    }
  }

  void save(final WidgetRef ref) async {
    await _useCase.save();
    _calendarUseCase.reloadState();
    _useCase.refreshState(ref);
    _scheduleListUseCase.reloadState();
  }

  void _popAndRefreshState(final BuildContext context, final WidgetRef ref) {
    Navigator.pop(context);
    _useCase.refreshState(ref);
  }

  Future<dynamic> _showModifiedPopup(final BuildContext context, final WidgetRef ref) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                // TODO 2回ポップするもっと良い方法を調べる
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                _useCase.refreshState(ref);
              },
              child: const Text(TextConstants.scheduleCreateViewActionSheetDiscardChanges),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(TextConstants.scheduleCreateViewActionSheetCancel),
            ),
          ],
        );
      },
    );
  }
}
