import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentDayProvider = StateNotifierProvider<CurrentDayModel, DateTime>((_) => CurrentDayModel(DateTime.now()));

class CurrentDayModel extends StateNotifier<DateTime> {
  CurrentDayModel (DateTime dateTime) : super(dateTime);

  void setToday() {
    state = DateTime.now();
  }
}