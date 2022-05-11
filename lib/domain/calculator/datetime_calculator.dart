
class DateTimeCalculator {
  static DateTime getClampedStartDateTime(DateTime startDateTime, DateTime endDateTime) {
    if (startDateTime.isAfter(endDateTime)) {
      return startDateTime;
    }
    return endDateTime;
  }

  static DateTime getClampedEndDateTime(DateTime startDateTime, DateTime endDateTime) {
    if (startDateTime.isBefore(endDateTime)) {
      return endDateTime;
    }
    return startDateTime.add(const Duration(hours: 1));
  }
}