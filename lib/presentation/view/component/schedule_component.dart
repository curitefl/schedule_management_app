import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final VoidCallback? _onPressedSave;

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
    required final VoidCallback? onPressedSave,
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
        _onPressedSave = onPressedSave,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('保存'),
              onPressed: _onPressedSave,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleTextEditingController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'タイトルを入力してください',
            ),
            onChanged: _onTitleChanged,
          ),
          Row(
            children: [
              const Text('終日'),
              Switch(
                value: _isWholeDay,
                onChanged: _onWholeDayChanged,
              ),
            ],
          ),
          WidgetFactory.createDatePickerButton(
            context,
            '開始',
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
            '終了',
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
                hintText: 'コメントを入力してください',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: _onDescriptionChanged,
            ),
          ),
        ],
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
}
