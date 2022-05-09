import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateState extends StateNotifier<ScheduleCreateViewModel> {
  ScheduleCreateState(final ScheduleCreateViewModel state) : super(state);

  ScheduleCreateState.init({required final ScheduleCreateViewModel state}) : super(state);

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

  void setStartDateTime(final DateTime startDateTimeUtc) {
    final dateTimeText = _getDateTimeText(startDateTimeUtc.toLocal(), state.isWholeDay);

    if (startDateTimeUtc.isBefore(state.endDateTime)) {
      state = state.copyWith(startDateTime: startDateTimeUtc, startDateTimeText: dateTimeText);
      return;
    }

    final endTime = state.isWholeDay ? startDateTimeUtc : startDateTimeUtc.add(const Duration(hours: 1));

    state = state.copyWith(
      startDateTime: startDateTimeUtc,
      startDateTimeText: dateTimeText,
      endDateTime: endTime,
      endDateTimeText: _getDateTimeText(endTime, state.isWholeDay),
    );
  }

  void setEndDateTime(final DateTime endDateTime) {
    final endDateTimeUtc = endDateTime.toUtc();
    final dateTimeText = _getDateTimeText(endDateTime, state.isWholeDay);
    state = state.copyWith(endDateTime: endDateTimeUtc, endDateTimeText: dateTimeText);
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
