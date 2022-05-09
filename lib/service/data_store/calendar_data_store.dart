import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

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

  Future<Schedule> getScheduleById(final int id) {
    return (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<Schedule>> getMonthScheduleEntries(final DateTime dateTime) {

    return (select(schedules)
          ..where((tbl) {
            final isEqualYear = tbl.startDateTime.year.equals(dateTime.year);
            final isEqualMonth = tbl.startDateTime.month.equals(dateTime.month);
            final result = isEqualYear & isEqualMonth;
            return result;
          }))
        .get();
  }

  Future<List<Schedule>> getDayScheduleEntries(final DateTime dateTime) {

    return (select(schedules)
          ..where((tbl) {
            final isEqualYear = tbl.startDateTime.year.equals(dateTime.year);
            final isEqualMonth = tbl.startDateTime.month.equals(dateTime.month);
            final isEqualDay = tbl.startDateTime.day.equals(dateTime.day);
            final result = isEqualYear & isEqualMonth & isEqualDay;
            return result;
          }))
        .get();
  }

  Future<int> addSchedule(
    final String title,
    final bool isWholeDay,
    final DateTime startDateTime,
    final DateTime endDateTime,
    final String description,
  ) {
    return into(schedules).insert(
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
  ) {
    return (update(schedules)..where((tbl) => tbl.id.equals(schedule.id))).write(
      SchedulesCompanion(
        title: Value(title),
        isWholeDay: Value(isWholeDay),
        startDateTime: Value(startDateTime),
        endDateTime: Value(endDateTime),
        description: Value(description),
      ),
    );
  }

  Future deleteSchedule(final Schedule schedule) {
    return (delete(schedules)..where((tbl) => tbl.id.equals(schedule.id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dataStoreDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(dataStoreDirectory.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
