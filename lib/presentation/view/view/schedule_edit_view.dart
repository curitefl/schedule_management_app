import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_edit_providers.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_edit_presenter.dart';
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
      child: TextButton(
        child: const Text(
          TextConstants.scheduleEditViewDeleteTitle,
          maxLines: 1,
        ),
        onPressed: () async {
          final isDiscard = await _showDeletePopup(context, presenter, viewModel.scheduleId);

          if(isDiscard) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Future<bool> _showDeletePopup(
    final BuildContext context,
    final ScheduleEditPresenter presenter,
    final int scheduleId,
  ) async {
    var isDiscard = false;

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text(TextConstants.scheduleEditViewDeleteTitle),
          message: const Text(TextConstants.scheduleEditViewDeleteMessage),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () async {
                await presenter.deleteSchedule(scheduleId);
                Navigator.pop(context);
                isDiscard = true;
              },
              child: const Text(TextConstants.scheduleEditViewDeleteConfirm),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: const Text(TextConstants.scheduleEditViewDeleteCancel),
            ),
          ],
        );
      },
    );
    return isDiscard;
  }
}
