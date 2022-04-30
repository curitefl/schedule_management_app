import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'schedule_list_view_model.freezed.dart';

@freezed
abstract class ScheduleListViewModel with _$ScheduleListViewModel {
  const factory ScheduleListViewModel({
    DateTime? dateTime,}
  ) = _ScheduleListViewModel;
}
