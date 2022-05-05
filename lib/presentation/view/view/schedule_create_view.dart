import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/provider/schedule_create_providers.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleCreateView extends HookConsumerWidget {
  const ScheduleCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(scheduleCreatePresenterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.scheduleCreateViewAppBarTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text(TextConstants.scheduleCreateViewSave),
              onPressed: presenter.getSaveCallback(),
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
          buildDatePickerButton(TextConstants.scheduleCreateViewStart, DateTime.now()),
          buildDatePickerButton(TextConstants.scheduleCreateViewEnd, DateTime.now()),
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

  Row buildDatePickerButton(String title, DateTime dateTime) {
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
