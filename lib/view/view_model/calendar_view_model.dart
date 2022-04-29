import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusedDayProvider = StateNotifierProvider<CalendarViewModel, DateTime>((_) => CalendarViewModel(DateTime.now()));

class CalendarViewModel extends StateNotifier<DateTime> {
  CalendarViewModel (DateTime dateTime) : super(dateTime);

  void setDateTime(DateTime dateTime) {
    state = dateTime;
  }
}