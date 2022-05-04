import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/provider/repository_provider.dart';

final calendarUseCaseProvider = Provider((ref) => CalendarUseCase(ref.watch(scheduleRepositoryProvider)));
