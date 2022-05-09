import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/presentation/view/factory/widget_factory.dart';

class ScheduleEditView extends HookConsumerWidget {
  const ScheduleEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定編集'),
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
              onPressed: () {
                // TODO 保存の処理
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'タイトルを入力してください',
            ),
            onChanged: (_) {
              // TODO 文字が入力されたときの処理
            },
          ),
          WidgetFactory.createDatePickerButton(
            context,
            '開始',
            DateTime.now().toString(),
            () {
              // TODO DatePickerを表示する処理
            },
          ),
          WidgetFactory.createDatePickerButton(
            context,
            '終了',
            DateTime.now().toString(),
            () {
              // TODO DatePickerを表示する処理
            },
          ),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'コメントを入力してください',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (_) {
                // TODO コメントが入力されたときの処理
              },
            ),
          ),
        ],
      ),
    );
  }
}
