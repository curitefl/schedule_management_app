import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/factory/widget_factory.dart';

class ScheduleCreateView extends HookConsumerWidget {
  const ScheduleCreateView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final viewModel = ref.watch(scheduleCreateStateProvider);
    final presenter = ref.watch(scheduleCreatePresenterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.scheduleCreateViewAppBarTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            presenter.closeView(context, ref);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text(TextConstants.scheduleCreateViewSave),
              onPressed: presenter.getSaveCallback(context, ref),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: TextConstants.scheduleCreateViewTitleHintText,
            ),
            onChanged: presenter.setTitle,
          ),
          Row(
            children: [
              const Text(TextConstants.scheduleCreateViewWholeDay),
              Switch(
                value: viewModel.isWholeDay,
                onChanged: presenter.setWholeDay,
              ),
            ],
          ),
          WidgetFactory.createDatePickerButton(
            context,
            TextConstants.scheduleCreateViewStart,
            viewModel.startDateTimeText,
            () {
              presenter.showStartDateTimePicker(context);
            },
          ),
          WidgetFactory.createDatePickerButton(
            context,
            TextConstants.scheduleCreateViewEnd,
            viewModel.endDateTimeText,
            () {
              presenter.showEndDateTimePicker(context);
            },
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: TextConstants.scheduleCreateViewCommentHintText,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: presenter.setDescription,
            ),
          ),
        ],
      ),
    );
  }
}
