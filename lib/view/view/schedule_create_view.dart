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
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: TextConstants.scheduleCreateViewHintText,
            ),
          ),
        ],
      ),
    );
  }
}