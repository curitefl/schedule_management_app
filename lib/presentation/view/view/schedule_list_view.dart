import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/provider/schedule_list_providers.dart';

class ScheduleListView extends HookConsumerWidget {
  const ScheduleListView({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final viewModel = ref.watch(scheduleListStateProvider);
    final presenter = ref.watch(scheduleListPresenterProvider);

    return AlertDialog(
      insetPadding: const EdgeInsets.all(24.0),
      contentPadding: const EdgeInsets.all(16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
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
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 2.0,
        width: MediaQuery.of(context).size.width - 24.0,
        child: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: viewModel.scheduleElements.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8.0,
              child: Divider(height: 8.0,),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Column(
                  children: [
                    for (var i = 0;
                        i < viewModel.scheduleElements[index].dateTimeTexts.length;
                        ++i) ...{
                      Text(viewModel.scheduleElements[index].dateTimeTexts[i]),
                    }
                  ],
                ),
                const SizedBox(width: 8.0),
                Container(
                  height: 50.0,
                  width: 5.0,
                  color:
                      viewModel.scheduleElements[index].isWholeDay ? Colors.redAccent : Colors.blue,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        viewModel.scheduleElements[index].scheduleTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      onPressed: () async {
                        await presenter.showScheduleEditView(
                            context,
                            viewModel.scheduleElements[index].scheduleId,
                            viewModel.selectedDateTime);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
