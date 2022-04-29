import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';

class ScheduleListView extends StatelessWidget {
  const ScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        DateFormat(
          TextConstants.scheduleListViewDateFormat,
          ScheduleListConstants.scheduleListLocale,
        ).format(DateTime.now()),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
