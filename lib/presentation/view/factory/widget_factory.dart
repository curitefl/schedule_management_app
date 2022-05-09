import 'package:flutter/material.dart';

class WidgetFactory {
  static Row createDatePickerButton(
    final BuildContext context,
    final String title,
    final String dateTimeText,
    final VoidCallback? onPressed,
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
