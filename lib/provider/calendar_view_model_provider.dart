import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/view/view_model/calendar_view_model.dart';

final calendarViewModelProvider = Provider((ref) => CalendarViewModel(
      focusedDay: DateTime.now(),
      currentDay: DateTime.now(),
      scheduleViewModelList: [],
    ));
