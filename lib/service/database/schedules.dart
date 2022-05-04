import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'schedules.g.dart';

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  BoolColumn get isWholeDay => boolean()();

  DateTimeColumn get startDateTime => dateTime()();

  DateTimeColumn get endDateTime => dateTime()();

  TextColumn get description => text()();
}

@DriftDatabase(tables: [Schedules])
class CalendarDatabase extends _$CalendarDatabase {
  CalendarDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<Schedule> getScheduleById(int id) {
    return (select(schedules)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<Schedule>> getMonthScheduleEntries (int month) {
    return (select(schedules)..where((tbl) => tbl.startDateTime.month.equals(month))).get();
  }

  Future<int> addSchedule(
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
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
    Schedule schedule,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
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

  Future<void> deleteSchedule(Schedule schedule) {
    return (delete(schedules)..where((tbl) => tbl.id.equals(schedule.id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final databaseDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(databaseDirectory.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
