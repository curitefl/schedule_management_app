import 'package:hooks_riverpod/hooks_riverpod.dart';

final focusedDayProvider = StateNotifierProvider<FocusedDayModel, DateTime>((_) => FocusedDayModel(DateTime.now()));

class FocusedDayModel extends StateNotifier<DateTime> {
  FocusedDayModel (DateTime dateTime) : super(dateTime);

  void setDateTime(DateTime dateTime) {
    state = dateTime;
  }
}