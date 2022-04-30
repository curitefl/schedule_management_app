class CalendarViewModel {
  DateTime currentDay;
  DateTime focusedDay;

  CalendarViewModel(this.currentDay, this.focusedDay);

  void focusToday() {
    var now = DateTime.now();
    focusedDay = now;
    currentDay = now;
  }

  void focusMonth(DateTime dateTime) {
    focusedDay = dateTime;
  }

  CalendarViewModel copy() {
    return CalendarViewModel(currentDay, focusedDay);
  }
}