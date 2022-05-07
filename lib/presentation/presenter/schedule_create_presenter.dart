import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/schedule_create_use_case.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_create_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreatePresenter {
  final ScheduleCreateState _state;
  final ScheduleCreateUseCase _useCase;

  ScheduleCreatePresenter(this._state, this._useCase);

  VoidCallback? getSaveCallback(BuildContext context, WidgetRef ref) {
    var callback = _useCase.getSaveCallback();
    if (callback == null) {
      return null;
    }

    return () {
      callback();
      _popAndRefreshState(context, ref);
    };
  }

  void setTitle(String title) {
    _useCase.setTitle(title);
  }

  void setDescription(String description) {
    _useCase.setDescription(description);
  }

  void setWholeDay(bool isWholeDay) {
    _useCase.setWholeDay(isWholeDay);
  }

  void showStartDateTimePicker(BuildContext context) {
    _showDateTimePicker(context, _state.viewModel, _state.viewModel.startDateTime, (dateTime) {
      _state.setStartDateTime(dateTime);
    });
  }

  void showEndDateTimePicker(BuildContext context) {
    _showDateTimePicker(context, _state.viewModel, _state.viewModel.endDateTime, (dateTime) {
      _state.setEndDateTime(dateTime);
    });
  }

  void closeView(BuildContext context, WidgetRef ref) {
    if (_state.viewModel.isModified) {
      _showModifiedPopup(context, ref);
    } else {
      _popAndRefreshState(context, ref);
    }
  }

  void _popAndRefreshState(BuildContext context, WidgetRef ref) {
    Navigator.pop(context);
    _useCase.refreshState(ref);
  }

  void _showDateTimePicker(
    BuildContext context,
    ScheduleCreateViewModel viewModel,
    DateTime initialDateTime,
    ValueChanged<DateTime> onDateTimeChanged,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 300.0,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 300.0,
                child: CupertinoDatePicker(
                  minuteInterval: 15,
                  use24hFormat: true,
                  mode: viewModel.isWholeDay
                      ? CupertinoDatePickerMode.date
                      : CupertinoDatePickerMode.dateAndTime,
                  dateOrder: DatePickerDateOrder.ymd,
                  minimumYear: ScheduleCreateConstants.minimumYear,
                  maximumYear: viewModel.maximumYear,
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showModifiedPopup(BuildContext context, WidgetRef ref) {
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
