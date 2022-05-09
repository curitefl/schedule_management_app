import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_edit_providers.dart';
import 'package:schedule_management_app/presentation/view/component/schedule_component.dart';

class ScheduleEditView extends HookConsumerWidget {
  const ScheduleEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(scheduleEditStateProvider);

    return ScheduleComponent(
      appBarText: '予定編集',
      titleTextEditingController: TextEditingController(text: viewModel.title),
      onTitleChanged: (_) {
        // TODO 文字が入力されたときの処理
      },
      isWholeDay: viewModel.isWholeDay,
      onWholeDayChanged: (_) {
        // TODO 終日スイッチの処理
      },
      startDateTime: viewModel.startDateTime,
      endDateTime: viewModel.endDateTime,
      startDateTimeText: viewModel.startDateTimeText,
      endDateTimeText: viewModel.endDateTimeText,
      onStartDateTimeChanged: (_) {
        // TODO 開始時間ピッカーをタップしたときの処理
      },
      onEndDateTimeChanged: (_) {
        // TODO 終了時間ピッカーをタップしたときの処理
      },
      descriptionTextEditingController: TextEditingController(text: viewModel.description),
      onDescriptionChanged: (_) {
        // TODO コメントが編集されたときの処理
      },
      onPressedSave: () {
        // TODO 保存の処理
      },
    );
  }
}
