import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';

class ScheduleCreateView extends StatelessWidget {
  const ScheduleCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.scheduleCreateViewAppBarTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: TextConstants.scheduleCreateViewHintText,
            ),
          ),
          Row(
            children: [
              const Text(TextConstants.scheduleCreateViewWholeDay),
              Switch(
                value: false,
                onChanged: (value) {
                  // TODO 終日スイッチがオフの場合は、オンにする。
                  // TODO 終日スイッチがオンの場合は、オフにする。
                },
              ),
            ],
          ),
          buildDatePickerButton(TextConstants.scheduleCreateViewStart, DateTime.now()),
          buildDatePickerButton(TextConstants.scheduleCreateViewEnd, DateTime.now()),
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
