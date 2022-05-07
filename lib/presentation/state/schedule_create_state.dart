import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';

class ScheduleCreateState extends StateNotifier<ScheduleCreateViewModel> {
  ScheduleCreateState(ScheduleCreateViewModel state) : super(state);

  ScheduleCreateState.init({required ScheduleCreateViewModel state}) : super(state);

  ScheduleCreateViewModel get viewModel => state;

  void setSelectedDay(DateTime dateTime) {
    var now = DateTime.now();
    var adjustedDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day, now.hour, now.minute);
    var startDateTime = _getQuarteredDateTime(adjustedDateTime);
    var endDateTime = startDateTime;

    state = state.copyWith(
      selectedDay: startDateTime,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      startDateTimeText: _getDateTimeText(startDateTime, state.isWholeDay),
      endDateTimeText: _getDateTimeText(endDateTime, state.isWholeDay),
    );
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
    _updateCanSave();
    _updateIsModified();
  }

  void setWholeDay(bool isWholeDay) {
    state = state.copyWith(
      isWholeDay: isWholeDay,
      startDateTimeText: _getDateTimeText(state.startDateTime, isWholeDay),
      endDateTimeText: _getDateTimeText(state.endDateTime, isWholeDay),
    );
  }

  void setStartDateTime(DateTime dateTime) {
    var dateTimeText = _getDateTimeText(dateTime, state.isWholeDay);
    state = state.copyWith(startDateTime: dateTime, startDateTimeText: dateTimeText);
  }

  void setEndDateTime(DateTime dateTime) {
    var dateTimeText = _getDateTimeText(dateTime, state.isWholeDay);
    state = state.copyWith(endDateTime: dateTime, endDateTimeText: dateTimeText);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
    _updateCanSave();
    _updateIsModified();
  }

  // TODO CanSaveの判定を見直す
  void _updateCanSave() {
    var canSave = state.title.isNotEmpty && state.description.isNotEmpty;
    state = state.copyWith(canSave: canSave);
  }

  void _updateIsModified() {
    var isModified = state.title.isNotEmpty || state.description.isNotEmpty;
    state = state.copyWith(isModified: isModified);
  }

  DateTime _getQuarteredDateTime(DateTime dateTime) {
    return dateTime.add(Duration(minutes: 15 - dateTime.minute % 15));
  }

  String _getDateTimeText(DateTime dateTime, bool isWholeDay) {
    return DateFormat(isWholeDay
            ? TextConstants.wholeDaySwitchOnDateFormat
            : TextConstants.wholeDaySwitchOffDateFormat)
        .format(dateTime);
  }
}
