import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/calculator/datetime_calculator.dart';
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
    final clampedEndDateTime = DateTimeCalculator.getClampedEndDateTime(startDateTime, state.endDateTime);

    state = state.copyWith(
      startDateTime: startDateTime,
      startDateTimeText: _getDateTimeText(startDateTime, state.isWholeDay),
      endDateTime: clampedEndDateTime,
      endDateTimeText: _getDateTimeText(clampedEndDateTime, state.isWholeDay),
      canSave: true,
      isModified: true,
    );
  }

  void setEndDateTime(final DateTime endDateTime) {
    final clampedStartDateTime = DateTimeCalculator.getClampedStartDateTime(state.startDateTime, endDateTime);

    state = state.copyWith(
      startDateTime: clampedStartDateTime,
      startDateTimeText: _getDateTimeText(clampedStartDateTime, state.isWholeDay),
      endDateTime: endDateTime,
      endDateTimeText: _getDateTimeText(endDateTime, state.isWholeDay),
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
