import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_provider.dart';
import 'package:schedule_management_app/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';

class ScheduleListView extends HookConsumerWidget {
  const ScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(scheduleListStateProvider);
    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat(
              TextConstants.scheduleListViewDateFormat,
              ScheduleListConstants.scheduleListLocale,
            ).format(viewModel.dateTime!),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {
              // TODO 予定追加画面を表示する
            },
          ),
        ],
      ),
      children: [
        Column(
          // TODO for文で回す
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(DateFormat(
                      TextConstants.scheduleListViewTimeFormat,
                      ScheduleListConstants.scheduleListLocale,
                    ).format(DateTime.now()),),
                    Text(DateFormat(
                      TextConstants.scheduleListViewTimeFormat,
                      ScheduleListConstants.scheduleListLocale,
                    ).format(DateTime.now()),),
                  ],
                ),
                const Text('スケジュールタイトル'),
              ],
            ),
          ],
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
