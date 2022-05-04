import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/provider/calendar_provider.dart';
import 'package:schedule_management_app/provider/repository_provider.dart';

final calendarUseCaseProvider = Provider(
  (ref) {
    return CalendarUseCase(
      ref.watch(scheduleRepositoryProvider),
      ref.read(calendarStateProvider.notifier),
    );
  },
);
