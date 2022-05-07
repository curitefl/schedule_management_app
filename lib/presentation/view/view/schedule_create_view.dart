import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/presenter/schedule_create_presenter.dart';
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
            if (viewModel.isModified) {
              _showModifiedPopup(context);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text(TextConstants.scheduleCreateViewSave),
              onPressed: presenter.getSaveCallback(context),
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
                value: false,
                onChanged: presenter.setWholeDay,
              ),
            ],
          ),
          _buildDatePickerButton(TextConstants.scheduleCreateViewStart, viewModel.startDateTime),
          _buildDatePickerButton(TextConstants.scheduleCreateViewEnd, viewModel.endDateTime),
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

  Future<dynamic> _showModifiedPopup(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                // TODO 2回ポップするもっと良い方法を調べる
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(TextConstants.scheduleCreateViewActionSheetDiscardChanges),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(TextConstants.scheduleCreateViewActionSheetCancel),
            ),
          ],
        );
      },
    );
  }

  Row _buildDatePickerButton(String title, DateTime dateTime) {
    return Row(
      children: [
        Text(title),
        TextButton(
          child: Text(
            // TODO 予定追加の場合は、選択された日付、現在の時間を表示する。
            DateFormat(TextConstants.wholeDaySwitchOffDateFormat).format(dateTime),
            // TODO 終日スイッチがオンの場合は、「yyyy-MM-dd 」形式で表示する。
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            // TODO 時間ピッカーの動作実装
          },
        ),
      ],
    );
  }
}
