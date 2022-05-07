import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_view_model.dart';

part 'calendar_view_model.freezed.dart';

@freezed
abstract class CalendarViewModel with _$CalendarViewModel {
  const factory CalendarViewModel({
    required final DateTime focusedDay,
    required final DateTime currentDay,
    required final List<ScheduleViewModel> scheduleViewModelList,
  }
      ) = _CalendarViewModel;
}