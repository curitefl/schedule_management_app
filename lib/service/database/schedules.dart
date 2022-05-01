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
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final databaseDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(databaseDirectory.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}