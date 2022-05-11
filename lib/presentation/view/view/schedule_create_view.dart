import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/view/component/schedule_component.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleCreateView extends HookConsumerWidget {
  const ScheduleCreateView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final viewModel = ref.watch(scheduleCreateStateProvider);
    final presenter = ref.watch(scheduleCreatePresenterProvider);

    return ScheduleComponent(
      appBarText: TextConstants.scheduleCreateViewAppBarTitle,
      title: viewModel.title,
      onTitleChanged: presenter.setTitle,
      isWholeDay: viewModel.isWholeDay,
      onWholeDayChanged: presenter.setWholeDay,
      startDateTime: viewModel.startDateTime,
      endDateTime: viewModel.endDateTime,
      startDateTimeText: viewModel.startDateTimeText,
      endDateTimeText: viewModel.endDateTimeText,
      onStartDateTimeChanged: presenter.setStartDateTime,
      onEndDateTimeChanged: presenter.setEndDateTime,
      description: viewModel.description,
      onDescriptionChanged: presenter.setDescription,
      canSave: viewModel.canSave,
      isModified: viewModel.isModified,
      onPressedSave: () async => await presenter.save(ref),
      onDiscard: () => presenter.refreshState(ref),
    );
  }
}
