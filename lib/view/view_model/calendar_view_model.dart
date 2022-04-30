class CalendarViewModel {
  DateTime focusedDay;
  DateTime currentDay;

  CalendarViewModel(this.focusedDay, this.currentDay);

  void focusToday() {
    var now = DateTime.now();
    focusedDay = now;
    currentDay = now;
  }

  void focusMonth(DateTime dateTime) {
    focusedDay = dateTime;
  }

  void setCurrentDay(DateTime dateTime) {
    focusedDay = dateTime;
    currentDay = dateTime;
  }

  CalendarViewModel copy() {
    return CalendarViewModel(currentDay, focusedDay);
  }
}