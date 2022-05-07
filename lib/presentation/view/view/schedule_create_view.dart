import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleCreateView extends HookConsumerWidget {
  const ScheduleCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          _buildDatePickerButton(
            context,
            TextConstants.scheduleCreateViewStart,
            viewModel.startDateTimeText,
            () {
              presenter.showStartDateTimePicker(context);
            },
          ),
          _buildDatePickerButton(
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

  Row _buildDatePickerButton(
    BuildContext context,
    String title,
    String dateTimeText,
    VoidCallback? onPressed,
  ) {
    return Row(
      children: [
        Text(title),
        TextButton(
          child: Text(
            dateTimeText,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
