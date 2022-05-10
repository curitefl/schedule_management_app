import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_component_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_create_constants.dart';
import 'package:schedule_management_app/presentation/view/factory/widget_factory.dart';

class ScheduleComponent extends StatelessWidget {
  final String _title;
  final TextEditingController _titleTextEditingController;
  final ValueChanged<String> _onTitleChanged;
  final bool _isWholeDay;
  final ValueChanged<bool> _onWholeDayChanged;
  final DateTime _startDateTime;
  final DateTime _endDateTime;
  final String _startDateTimeText;
  final String _endDateTimeText;
  final ValueChanged<DateTime> _onStartDateTimeChanged;
  final ValueChanged<DateTime> _onEndDateTimeChanged;
  final TextEditingController _descriptionTextEditingController;
  final ValueChanged<String> _onDescriptionChanged;
  final bool _canSave;
  final bool _isModified;
  final VoidCallback _onPressedSave;
  final VoidCallback _onDiscard;

  const ScheduleComponent({
    final Key? key,
    required final String appBarText,
    required final TextEditingController titleTextEditingController,
    required final ValueChanged<String> onTitleChanged,
    required final bool isWholeDay,
    required final ValueChanged<bool> onWholeDayChanged,
    required final DateTime startDateTime,
    required final DateTime endDateTime,
    required final String startDateTimeText,
    required final String endDateTimeText,
    required final ValueChanged<DateTime> onStartDateTimeChanged,
    required final ValueChanged<DateTime> onEndDateTimeChanged,
    required final TextEditingController descriptionTextEditingController,
    required final ValueChanged<String> onDescriptionChanged,
    required final bool canSave,
    required final bool isModified,
    required final VoidCallback onPressedSave,
    required final VoidCallback onDiscard,
  })  : _title = appBarText,
        _titleTextEditingController = titleTextEditingController,
        _onTitleChanged = onTitleChanged,
        _isWholeDay = isWholeDay,
        _onWholeDayChanged = onWholeDayChanged,
        _startDateTime = startDateTime,
        _endDateTime = endDateTime,
        _startDateTimeText = startDateTimeText,
        _endDateTimeText = endDateTimeText,
        _onStartDateTimeChanged = onStartDateTimeChanged,
        _onEndDateTimeChanged = onEndDateTimeChanged,
        _descriptionTextEditingController = descriptionTextEditingController,
        _onDescriptionChanged = onDescriptionChanged,
        _canSave = canSave,
        _isModified = isModified,
        _onPressedSave = onPressedSave,
        _onDiscard = onDiscard,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _closeView(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text(ScheduleComponentConstants.save),
              onPressed: _getSaveCallback(context),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleTextEditingController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: ScheduleComponentConstants.titleHintText,
                border: OutlineInputBorder(),
              ),
              onChanged: _onTitleChanged,
            ),
            SwitchListTile(
              title: const Text(ScheduleComponentConstants.wholeDay),
              value: _isWholeDay,
              onChanged: _onWholeDayChanged,
            ),
            WidgetFactory.createDatePickerButton(
              context,
              ScheduleComponentConstants.start,
              _startDateTimeText,
              () {
                _showDateTimePicker(
                  context,
                  _startDateTime,
                  _startDateTime.year + 100,
                  _isWholeDay,
                  _onStartDateTimeChanged,
                );
              },
            ),
            WidgetFactory.createDatePickerButton(
              context,
              ScheduleComponentConstants.end,
              _endDateTimeText,
              () {
                _showDateTimePicker(
                  context,
                  _endDateTime,
                  _startDateTime.year + 100,
                  _isWholeDay,
                  _onEndDateTimeChanged,
                );
              },
            ),
            Expanded(
              child: TextField(
                controller: _descriptionTextEditingController,
                decoration: const InputDecoration(
                  hintText: ScheduleComponentConstants.descriptionHintText,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: _onDescriptionChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDateTimePicker(
    final BuildContext context,
    final DateTime initialDateTime,
    final int maximumYear,
    final bool isWholeDay,
    final ValueChanged<DateTime> onDateTimeChanged,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 300.0,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 300.0,
                child: CupertinoDatePicker(
                  minuteInterval: 15,
                  use24hFormat: true,
                  mode: isWholeDay
                      ? CupertinoDatePickerMode.date
                      : CupertinoDatePickerMode.dateAndTime,
                  dateOrder: DatePickerDateOrder.ymd,
                  minimumYear: ScheduleCreateConstants.minimumYear,
                  maximumYear: maximumYear,
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: onDateTimeChanged,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  VoidCallback? _getSaveCallback(BuildContext context) {
    if (!_canSave) {
      return null;
    }

    return () {
      _onPressedSave();
      Navigator.pop(context);
      _onDiscard();
    };
  }

  void _closeView(final BuildContext context) {
    if (_isModified) {
      _showModifiedPopup(context);
    } else {
      Navigator.pop(context);
      _onDiscard();
    }
  }

  Future<dynamic> _showModifiedPopup(final BuildContext context) {
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
                _onDiscard();
              },
              child: const Text(ScheduleComponentConstants.confirmationDiscard),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: const Text(ScheduleComponentConstants.confirmationCancel),
            ),
          ],
        );
      },
    );
  }
}
