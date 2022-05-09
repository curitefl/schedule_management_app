import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_create_view.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_list_view.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';

class TransitionUseCase {
  final ScheduleRepository _repository;
  final ScheduleListState _scheduleListState;
  final ScheduleCreateState _scheduleCreateState;

  TransitionUseCase(
    final this._repository,
    final this._scheduleListState,
    final this._scheduleCreateState,
  );

  Future showScheduleListView(final BuildContext context, final DateTime selectedDateTime) async {
    _scheduleListState.setSelectedDay(selectedDateTime);
    await _refreshScheduleListState(selectedDateTime);

    return showDialog(
      context: context,
      builder: (builder) {
        return const ScheduleListView();
      },// TODO 予定一覧画面を閉じたときにカレンダーを更新する
    );/*.then(
      (value) async => await _refreshScheduleListState(
        selectedDay.year,
        selectedDay.month,
        selectedDay.day,
      ),
    );*/
  }

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDay) {
    _scheduleCreateState.setSelectedDay(selectedDay);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ScheduleCreateView();
        },
      ),
    );
  }

  Future _refreshScheduleListState(final DateTime dateTime) async {
    final entries = await _repository.getDayScheduleEntries(dateTime);

    final scheduleElements = entries
        .map((entry) => ScheduleListElementModel(
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
