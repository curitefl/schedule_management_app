import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_edit_view_model.freezed.dart';

@freezed
abstract class ScheduleEditViewModel with _$ScheduleEditViewModel {
  const factory ScheduleEditViewModel({
    required final int maximumYear,
    required final String title,
    required final bool isWholeDay,
    required final DateTime startDateTime,
    required final DateTime endDateTime,
    required final String startDateTimeText,
    required final String endDateTimeText,
    required final String description,
    required final bool canSave,
    required final bool isModified,
  }) = _ScheduleEditViewModel;
}
