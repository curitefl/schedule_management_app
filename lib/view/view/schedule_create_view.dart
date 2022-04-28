import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}