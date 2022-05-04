import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/provider/calendar_provider.dart';
import 'package:schedule_management_app/provider/use_case_provider.dart';

/// TODO サンプルなので後で消す
class DriftSampleView extends HookConsumerWidget {
  const DriftSampleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarUseCase = ref.watch(calendarUseCaseProvider);
    final calendarViewModel = ref.watch(calendarStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              //10
              //以下、Container()をStreamBuilder(...)に置き換え
              child: ListView.builder(
                //11
                itemCount: calendarViewModel.scheduleViewModelList.length,
                itemBuilder: (context, index) {
                  var currentData = calendarViewModel.scheduleViewModelList[index];
                  return Container(
                    child: Column(
                      children: [
                        for (var i = 0;
                            i < calendarViewModel.scheduleViewModelList.length;
                            ++i) ...{
                          Text('title:${currentData.title}'),
                          Text('isWholeDay:${currentData.isWholeDay}'),
                          Text('startDateTime:${currentData.startDateTime}'),
                          Text('endDateTime:${currentData.endDateTime}'),
                          Text('description:${currentData.description}'),
                        },
                        TextButton(
                          onPressed: () async {
                            await calendarUseCase.updateSchedule(
                                5,
                                currentData.id,
                                '${currentData.title}(Updated)',
                                !currentData.isWholeDay,
                                currentData.startDateTime.add(Duration(minutes: 30)),
                                currentData.endDateTime.add(Duration(minutes: 30)),
                                '${currentData.description}(Updated)');
                          },
                          child: const Text('Update'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await calendarUseCase.deleteSchedule(
                              5,
                              currentData.id,
                            );
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () async {
                        await calendarUseCase.addSchedule(
                          5,
                          'test test test',
                          false,
                          DateTime.now(),
                          DateTime.now().add(Duration(hours: 1)),
                          'description description description',
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                        child: const Text('5月'),
                        onPressed: () async {
                          final list = await calendarUseCase.getMonthScheduleEntries(5);
                          if (list.isNotEmpty) {
                            for (var i = 0; i < list.length; ++i) {
                              print('${list[i]}\n');
                            }
                          }
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text('Refresh'),
                      onPressed: () async {
                        await calendarUseCase.refreshViewModel(5);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
