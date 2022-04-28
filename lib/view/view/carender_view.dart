import 'package:flutter/material.dart';
import 'package:schedule_management_app/view/constants/text_constants.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.calenderViewAppBarTitle),
        centerTitle: true,
      ),
    );
  }
}
