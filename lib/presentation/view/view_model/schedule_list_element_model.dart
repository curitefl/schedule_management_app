import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_list_element_model.freezed.dart';

@freezed
abstract class ScheduleListElementModel with _$ScheduleListElementModel {
  const factory ScheduleListElementModel({
    required final bool isWholeDay,
    required final DateTime startDateTime,
    required final DateTime endDateTime,
    required final String scheduleTitle,
  }) = _ScheduleListElementModel;
}
