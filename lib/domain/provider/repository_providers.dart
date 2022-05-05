import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/service/database/schedules.dart';

final calendarDataBaseProvider = Provider((ref) => CalendarDatabase());
