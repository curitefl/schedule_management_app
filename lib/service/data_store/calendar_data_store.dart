import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:schedule_management_app/service/data_store/deep_date_time_expressions.dart';

part 'calendar_data_store.g.dart';

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get isWholeDay => boolean()();

  DateTimeColumn get startDateTime => dateTime()();

  DateTimeColumn get endDateTime => dateTime()();

  TextColumn get description => text()();
}

@DriftDatabase(tables: [Schedules])
class CalendarDataStore extends _$CalendarDataStore {
  CalendarDataStore() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Schedule>> getMonthScheduleEntries(final DateTime dateTime) async {
    return await (select(schedules)..where((tbl) => tbl.startDateTime.dateYearMonthEquals(dateTime)))
        .get();
  }

  Future<List<Schedule>> getDayScheduleEntries(final DateTime dateTime) async {
    return await (select(schedules)
          ..where((tbl) => tbl.startDateTime.dateEquals(dateTime))
          ..orderBy([
            (entry) => OrderingTerm(expression: entry.isWholeDay, mode: OrderingMode.desc),
            (entry) => OrderingTerm(expression: entry.startDateTime, mode: OrderingMode.asc)
          ]))
        .get();
  }

  Future<Schedule> getScheduleEntry(final int scheduleId) async {
    return await (select(schedules)..where((tbl) => tbl.id.equals(scheduleId))).getSingle();
  }

  Future<int> addSchedule(
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    return await into(schedules).insert(
      SchedulesCompanion(
        title: Value(title),
        isWholeDay: Value(isWholeDay),
        startDateTime: Value(startDateTime),
        endDateTime: Value(endDateTime),
        description: Value(description),
      ),
    );
  }

  Future<int> updateSchedule(
    final Schedule schedule,
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) async {
    return await (update(schedules)..where((tbl) => tbl.id.equals(schedule.id))).write(
      SchedulesCompanion(
        title: Value(title),
        isWholeDay: Value(isWholeDay),
        startDateTime: Value(startDateTime),
        endDateTime: Value(endDateTime),
        description: Value(description),
      ),
    );
  }

  Future<void> deleteSchedule(final Schedule schedule) async {
    await (delete(schedules)..where((tbl) => tbl.id.equals(schedule.id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dataStoreDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(dataStoreDirectory.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
