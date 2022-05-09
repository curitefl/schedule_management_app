import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';

part 'schedule_list_view_model.freezed.dart';

@freezed
abstract class ScheduleListViewModel with _$ScheduleListViewModel {
  const factory ScheduleListViewModel({
    required final DateTime selectedDateTime,
    required final String selectedDateTimeText,
    required final String weekDayText,
    required final Color weekDayColor,
    required final List<ScheduleListElementModel> scheduleElements,
  }) = _ScheduleListViewModel;
}
