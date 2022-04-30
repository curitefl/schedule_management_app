import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calendar_view_model.freezed.dart';

@freezed
abstract class CalendarViewModel with _$CalendarViewModel {
  const factory CalendarViewModel({
    required DateTime focusedDay,
    required DateTime currentDay}
      ) = _CalendarViewModel;
}