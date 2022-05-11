import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/calculator/datetime_calculator.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateState extends StateNotifier<ScheduleCreateViewModel> {
  ScheduleCreateState(final ScheduleCreateViewModel state) : super(state);

  ScheduleCreateViewModel get viewModel => state;

  void setSelectedDay(final DateTime dateTime) {
    final now = DateTime.now();

    final adjustedDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      now.hour,
      now.minute,
    );

    final startDateTime = _getQuarteredDateTime(adjustedDateTime);
    final endDateTime = startDateTime;

    state = state.copyWith(
      selectedDateTime: startDateTime,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      startDateTimeText: _getDateTimeText(startDateTime, state.isWholeDay),
      endDateTimeText: _getDateTimeText(endDateTime, state.isWholeDay),
    );
  }

  void setTitle(final String title) {
    state = state.copyWith(title: title);
    _updateCanSave();
    _updateIsModified();
  }

  void setWholeDay(final bool isWholeDay) {
    state = state.copyWith(
      isWholeDay: isWholeDay,
      startDateTimeText: _getDateTimeText(state.startDateTime, isWholeDay),
      endDateTimeText: _getDateTimeText(state.endDateTime, isWholeDay),
    );
  }

  void setStartDateTime(final DateTime startDateTime) {
    final clampedEndDateTime = DateTimeCalculator.getClampedEndDateTime(startDateTime, state.endDateTime);

    state = state.copyWith(
      startDateTime: startDateTime,
      startDateTimeText: _getDateTimeText(startDateTime, state.isWholeDay),
      endDateTime: clampedEndDateTime,
      endDateTimeText: _getDateTimeText(clampedEndDateTime, state.isWholeDay),
    );
  }

  void setEndDateTime(final DateTime endDateTime) {
    final clampedStartDateTime = DateTimeCalculator.getClampedStartDateTime(state.startDateTime, endDateTime);

    state = state.copyWith(
      startDateTime: clampedStartDateTime,
      startDateTimeText: _getDateTimeText(clampedStartDateTime, state.isWholeDay),
      endDateTime: endDateTime,
      endDateTimeText: _getDateTimeText(endDateTime, state.isWholeDay),
    );
  }

  void setDescription(final String description) {
    state = state.copyWith(description: description);
    _updateCanSave();
    _updateIsModified();
  }

  void _updateCanSave() {
    final canSave = state.title.isNotEmpty && state.description.isNotEmpty;
    state = state.copyWith(canSave: canSave);
  }

  void _updateIsModified() {
    final isModified = state.title.isNotEmpty || state.description.isNotEmpty;
    state = state.copyWith(isModified: isModified);
  }

  DateTime _getQuarteredDateTime(final DateTime dateTime) {
    return dateTime.add(Duration(minutes: 15 - dateTime.minute % 15));
  }

  String _getDateTimeText(final DateTime dateTime, final bool isWholeDay) {
    return DateFormat(isWholeDay
            ? TextConstants.wholeDaySwitchOnDateFormat
            : TextConstants.wholeDaySwitchOffDateFormat)
        .format(dateTime);
  }
}
