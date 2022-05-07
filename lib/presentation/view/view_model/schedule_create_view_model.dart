import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_create_view_model.freezed.dart';

@freezed
abstract class ScheduleCreateViewModel with _$ScheduleCreateViewModel {
  const factory ScheduleCreateViewModel({
    required DateTime selectedDay,
    required String title,
    required bool isWholeDay,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required String startDateTimeText,
    required String endDateTimeText,
    required String description,
    required bool canSave,
    required bool isModified,
  }) = _ScheduleCreateViewModel;
}
