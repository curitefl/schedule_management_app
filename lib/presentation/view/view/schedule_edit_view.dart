import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_edit_providers.dart';
import 'package:schedule_management_app/presentation/view/component/schedule_component.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleEditView extends HookConsumerWidget {
  const ScheduleEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(scheduleEditStateProvider);
    final presenter = ref.watch(scheduleEditPresenterProvider);

    return ScheduleComponent(
      appBarText: TextConstants.scheduleEditViewAppBarTitle,
      titleTextEditingController: TextEditingController(text: viewModel.title),
      onTitleChanged: presenter.setTitle,
      isWholeDay: viewModel.isWholeDay,
      onWholeDayChanged: presenter.setWholeDay,
      startDateTime: viewModel.startDateTime,
      endDateTime: viewModel.endDateTime,
      startDateTimeText: viewModel.startDateTimeText,
      endDateTimeText: viewModel.endDateTimeText,
      onStartDateTimeChanged: presenter.setStartDateTime,
      onEndDateTimeChanged: presenter.setEndDateTime,
      descriptionTextEditingController: TextEditingController(text: viewModel.description),
      onDescriptionChanged: presenter.setDescription,
      canSave: viewModel.canSave,
      isModified: viewModel.isModified,
      onPressedSave: () async => await presenter.save(ref),
      onDiscard: () => presenter.refreshState(ref),
    );
  }
}
