import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_view_model.freezed.dart';

@freezed
class ScheduleViewModel with _$ScheduleViewModel {
  const factory ScheduleViewModel({
    required int id,
    required String title,
    required bool isWholeDay,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required String description,
  }) = _ScheduleViewModel;
}
