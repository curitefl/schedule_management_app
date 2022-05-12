import 'package:flutter/material.dart';

class WidgetFactory {
  static ListTile createDatePickerButton(
    final BuildContext context,
    final String title,
    final String dateTimeText,
    final VoidCallback? onPressed,
  ) {
    return ListTile(
      title: Text(title),
      trailing: TextButton(
        child: Text(
          dateTimeText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
