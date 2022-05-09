import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_edit_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_create_view.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_edit_view.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_list_view.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';

class TransitionUseCase {
  final ScheduleRepository _repository;
  final ScheduleListState _scheduleListState;
  final ScheduleCreateState _scheduleCreateState;
  final ScheduleEditState _scheduleEditState;

  TransitionUseCase(
    final this._repository,
    final this._scheduleListState,
    final this._scheduleCreateState,
    final this._scheduleEditState,
  );

  Future showScheduleListView(final BuildContext context, final DateTime selectedDateTime) async {
    _scheduleListState.setSelectedDay(selectedDateTime);
    await _refreshScheduleListState(selectedDateTime);

    return showDialog(
      context: context,
      builder: (builder) {
        return const ScheduleListView();
      },
    );
  }

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDateTime) {
    _scheduleCreateState.setSelectedDay(selectedDateTime);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ScheduleCreateView();
        },
      ),
    ).then(
      (value) async => await _refreshScheduleListState(selectedDateTime),
    );
  }

  void showScheduleEditView(final BuildContext context, final int scheduleId) async {
    final schedule = await _repository.getScheduleEntry(scheduleId);

    _scheduleEditState.set(
      schedule.title,
      schedule.isWholeDay,
      schedule.startDateTime,
      schedule.endDateTime,
      schedule.description,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ScheduleEditView();
        },
      ),
    );
  }

  Future _refreshScheduleListState(final DateTime dateTime) async {
    final entries = await _repository.getDayScheduleEntries(dateTime);

    final scheduleElements = entries
        .map((entry) => ScheduleListElementModel(
              scheduleId: entry.id,
              isWholeDay: entry.isWholeDay,
              startDateTime: entry.startDateTime,
              endDateTime: entry.endDateTime,
              dateTimeTexts: entry.isWholeDay
                  ? [TextConstants.scheduleListViewWholeDay]
                  : [
                      _getDateTimeText().format(entry.startDateTime),
                      _getDateTimeText().format(entry.endDateTime),
                    ],
              scheduleTitle: entry.title,
            ))
        .toList();

    _scheduleListState.setScheduleElements(scheduleElements);
  }

  DateFormat _getDateTimeText() => DateFormat(
        TextConstants.scheduleListViewTimeFormat,
        ScheduleListConstants.scheduleListLocale,
      );
}
