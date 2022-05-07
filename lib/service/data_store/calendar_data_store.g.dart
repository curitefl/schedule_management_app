// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data_store.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final String title;
  final bool isWholeDay;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String description;
  Schedule(
      {required this.id,
      required this.title,
      required this.isWholeDay,
      required this.startDateTime,
      required this.endDateTime,
      required this.description});
  factory Schedule.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Schedule(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      isWholeDay: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_whole_day'])!,
      startDateTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date_time'])!,
      endDateTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date_time'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['is_whole_day'] = Variable<bool>(isWholeDay);
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    map['end_date_time'] = Variable<DateTime>(endDateTime);
    map['description'] = Variable<String>(description);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      title: Value(title),
      isWholeDay: Value(isWholeDay),
      startDateTime: Value(startDateTime),
      endDateTime: Value(endDateTime),
      description: Value(description),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isWholeDay: serializer.fromJson<bool>(json['isWholeDay']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      endDateTime: serializer.fromJson<DateTime>(json['endDateTime']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isWholeDay': serializer.toJson<bool>(isWholeDay),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'endDateTime': serializer.toJson<DateTime>(endDateTime),
      'description': serializer.toJson<String>(description),
    };
  }

  Schedule copyWith(
          {int? id,
          String? title,
          bool? isWholeDay,
          DateTime? startDateTime,
          DateTime? endDateTime,
          String? description}) =>
      Schedule(
        id: id ?? this.id,
        title: title ?? this.title,
        isWholeDay: isWholeDay ?? this.isWholeDay,
        startDateTime: startDateTime ?? this.startDateTime,
        endDateTime: endDateTime ?? this.endDateTime,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isWholeDay: $isWholeDay, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, isWholeDay, startDateTime, endDateTime, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.title == this.title &&
          other.isWholeDay == this.isWholeDay &&
          other.startDateTime == this.startDateTime &&
          other.endDateTime == this.endDateTime &&
          other.description == this.description);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> isWholeDay;
  final Value<DateTime> startDateTime;
  final Value<DateTime> endDateTime;
  final Value<String> description;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isWholeDay = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
    this.description = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required bool isWholeDay,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required String description,
  })  : title = Value(title),
        isWholeDay = Value(isWholeDay),
        startDateTime = Value(startDateTime),
        endDateTime = Value(endDateTime),
        description = Value(description);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? isWholeDay,
    Expression<DateTime>? startDateTime,
    Expression<DateTime>? endDateTime,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isWholeDay != null) 'is_whole_day': isWholeDay,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (endDateTime != null) 'end_date_time': endDateTime,
      if (description != null) 'description': description,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<bool>? isWholeDay,
      Value<DateTime>? startDateTime,
      Value<DateTime>? endDateTime,
      Value<String>? description}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isWholeDay: isWholeDay ?? this.isWholeDay,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isWholeDay.present) {
      map['is_whole_day'] = Variable<bool>(isWholeDay.value);
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (endDateTime.present) {
      map['end_date_time'] = Variable<DateTime>(endDateTime.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isWholeDay: $isWholeDay, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isWholeDayMeta = const VerificationMeta('isWholeDay');
  @override
  late final GeneratedColumn<bool?> isWholeDay = GeneratedColumn<bool?>(
      'is_whole_day', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_whole_day IN (0, 1))');
  final VerificationMeta _startDateTimeMeta =
      const VerificationMeta('startDateTime');
  @override
  late final GeneratedColumn<DateTime?> startDateTime =
      GeneratedColumn<DateTime?>('start_date_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endDateTimeMeta =
      const VerificationMeta('endDateTime');
  @override
  late final GeneratedColumn<DateTime?> endDateTime =
      GeneratedColumn<DateTime?>('end_date_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, isWholeDay, startDateTime, endDateTime, description];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_whole_day')) {
      context.handle(
          _isWholeDayMeta,
          isWholeDay.isAcceptableOrUnknown(
              data['is_whole_day']!, _isWholeDayMeta));
    } else if (isInserting) {
      context.missing(_isWholeDayMeta);
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
          _startDateTimeMeta,
          startDateTime.isAcceptableOrUnknown(
              data['start_date_time']!, _startDateTimeMeta));
    } else if (isInserting) {
      context.missing(_startDateTimeMeta);
    }
    if (data.containsKey('end_date_time')) {
      context.handle(
          _endDateTimeMeta,
          endDateTime.isAcceptableOrUnknown(
              data['end_date_time']!, _endDateTimeMeta));
    } else if (isInserting) {
      context.missing(_endDateTimeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Schedule.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

abstract class _$CalendarDataStore extends GeneratedDatabase {
  _$CalendarDataStore(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedules];
}
