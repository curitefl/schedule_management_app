import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/provider/calendar_database_provider.dart';

final scheduleRepositoryProvider =
    Provider((ref) => ScheduleRepository(ref.watch(calendarDataBaseProvider)));
