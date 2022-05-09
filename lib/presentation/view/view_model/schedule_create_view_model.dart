import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_create_view_model.freezed.dart';

@freezed
abstract class ScheduleCreateViewModel with _$ScheduleCreateViewModel {
  const factory ScheduleCreateViewModel({
    required final int maximumYear,
    required final DateTime selectedDateTime,
    required final String title,
    required final bool isWholeDay,
    required final DateTime startDateTime,
    required final DateTime endDateTime,
    required final String startDateTimeText,
    required final String endDateTimeText,
    required final String description,
    required final bool canSave,
    required final bool isModified,
  }) = _ScheduleCreateViewModel;
}
