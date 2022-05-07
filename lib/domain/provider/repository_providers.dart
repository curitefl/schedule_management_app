import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';

final calendarDataStoreProvider = Provider((ref) => CalendarDataStore());
