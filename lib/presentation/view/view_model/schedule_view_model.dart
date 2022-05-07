import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_view_model.freezed.dart';

@freezed
class ScheduleViewModel with _$ScheduleViewModel {
  const factory ScheduleViewModel({
    required final int id,
    required final String title,
    required final bool isWholeDay,
    required final DateTime startDateTime,
    required final DateTime endDateTime,
    required final String description,
  }) = _ScheduleViewModel;
}
