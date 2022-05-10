import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_edit_view_model.dart';

class ScheduleEditState extends StateNotifier<ScheduleEditViewModel> {
  ScheduleEditState(final ScheduleEditViewModel state) : super(state);

  ScheduleEditViewModel get viewModel => state;

  void set(
    int scheduleId,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) {
    state = state.copyWith(
      scheduleId: scheduleId,
      maximumYear: startDateTime.year + 100,
      title: title,
      isWholeDay: isWholeDay,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      startDateTimeText: _getDateTimeText(startDateTime, isWholeDay),
      endDateTimeText: _getDateTimeText(endDateTime, isWholeDay),
      description: description,
    );
  }

  void setTitle(final String title) {
    state = state.copyWith(title: title, canSave: true, isModified: true);
  }

  void setWholeDay(final bool isWholeDay) {
    state = state.copyWith(
      isWholeDay: isWholeDay,
      startDateTimeText: _getDateTimeText(state.startDateTime, isWholeDay),
      endDateTimeText: _getDateTimeText(state.endDateTime, isWholeDay),
      canSave: true,
      isModified: true,
    );
  }

  void setStartDateTime(final DateTime startDateTime) {
    final dateTimeText = _getDateTimeText(startDateTime.toLocal(), state.isWholeDay);

    if (startDateTime.isBefore(state.endDateTime)) {
      state = state.copyWith(
        startDateTime: startDateTime,
        startDateTimeText: dateTimeText,
        canSave: true,
        isModified: true,
      );
      return;
    }

    final endTime = state.isWholeDay ? startDateTime : startDateTime.add(const Duration(hours: 1));

    state = state.copyWith(
      startDateTime: startDateTime,
      startDateTimeText: dateTimeText,
      endDateTime: endTime,
      endDateTimeText: _getDateTimeText(endTime, state.isWholeDay),
      canSave: true,
      isModified: true,
    );
  }

  void setEndDateTime(final DateTime endDateTime) {
    final endDateTimeUtc = endDateTime.toUtc();
    final dateTimeText = _getDateTimeText(endDateTime, state.isWholeDay);
    state = state.copyWith(
      endDateTime: endDateTimeUtc,
      endDateTimeText: dateTimeText,
      canSave: true,
      isModified: true,
    );
  }

  void setDescription(final String description) {
    state = state.copyWith(
      description: description,
      canSave: true,
      isModified: true,
    );
  }

  String _getDateTimeText(final DateTime dateTime, final bool isWholeDay) {
    return DateFormat(isWholeDay
            ? TextConstants.wholeDaySwitchOnDateFormat
            : TextConstants.wholeDaySwitchOffDateFormat)
        .format(dateTime);
  }
}
