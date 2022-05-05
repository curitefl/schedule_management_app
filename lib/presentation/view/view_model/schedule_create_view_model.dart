import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_create_view_model.freezed.dart';

@freezed
abstract class ScheduleCreateViewModel with _$ScheduleCreateViewModel {
  const factory ScheduleCreateViewModel({
    required String title,
    required bool isWholeDay,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required String description,
    required bool canSave,
  }) = _ScheduleCreateViewModel;
}
