import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';

class ScheduleListView extends HookConsumerWidget {
  const ScheduleListView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final viewModel = ref.watch(scheduleListStateProvider);
    final presenter = ref.watch(scheduleListPresenterProvider);

    return SimpleDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(
                  text: viewModel.selectedDateTimeText,
                ),
                TextSpan(
                  text: viewModel.weekDayText,
                  style: TextStyle(color: viewModel.weekDayColor),
                ),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {
              presenter.showScheduleCreateView(context, viewModel.selectedDateTime);
            },
          ),
        ],
      ),
      children: [
        Column(
          children: [
            for (var i = 0; i < viewModel.scheduleElements.length; ++i) ...{
              Row(
                children: [
                  Column(
                    children: [
                      for (var j = 0;
                          j < viewModel.scheduleElements[i].dateTimeTexts.length;
                          ++j) ...{
                        Text(viewModel.scheduleElements[i].dateTimeTexts[j]),
                      }
                    ],
                  ),
                  Text(viewModel.scheduleElements[i].scheduleTitle),
                ],
              ),
            }
          ],
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }
}
