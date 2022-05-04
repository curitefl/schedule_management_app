import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedule_management_app/domain/use_case/calendar_use_case.dart';
import 'package:schedule_management_app/provider/repository_provider.dart';
import 'package:schedule_management_app/provider/use_case_provider.dart';
import 'package:schedule_management_app/service/database/schedules.dart';

/// TODO サンプルなので後で消す
class DriftSampleView extends HookConsumerWidget {
  const DriftSampleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarUseCase = ref.watch(calendarUseCaseProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              //10
              //以下、Container()をStreamBuilder(...)に置き換え
              child: StreamBuilder(
                stream: calendarUseCase.watchEntries(),
                builder: (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    //11
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var currentData = snapshot.data![index];
                      return Container(
                        child: Column(
                          children: [
                            Text('title:${currentData.title}'),
                            Text('isWholeDay:${currentData.isWholeDay}'),
                            Text('startDateTime:${currentData.startDateTime}'),
                            Text('endDateTime:${currentData.endDateTime}'),
                            Text('description:${currentData.description}'),
                            TextButton(
                              onPressed: () async {
                                await calendarUseCase.updateSchedule(
                                    currentData,
                                    '${currentData.title}(Updated)',
                                    !currentData.isWholeDay,
                                    currentData.startDateTime.add(Duration(minutes: 30)),
                                    currentData.endDateTime.add(Duration(minutes: 30)),
                                    '${currentData.description}(Updated)');
                              },
                              child: Text('Update'),
                            ),
                          ],
                        ),
                        // onPressed: () async {
                        // },
                      );
                    },
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
                        child: const Text('remove'),
                        onPressed: () async {
                          final list = await calendarUseCase.allScheduleEntries;
                          if (list.isNotEmpty) {
                            await calendarUseCase.deleteSchedule(list[list.length - 1]);
                          }
                        }),
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
                            for(var i = 0; i < list.length; ++i) {
                              print('${list[i]}\n');
                            }
                          }
                        }),
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
