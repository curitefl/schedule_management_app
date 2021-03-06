// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_list_element_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleListElementModel {
  int get scheduleId => throw _privateConstructorUsedError;
  bool get isWholeDay => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get endDateTime => throw _privateConstructorUsedError;
  List<String> get dateTimeTexts => throw _privateConstructorUsedError;
  String get scheduleTitle => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleListElementModelCopyWith<ScheduleListElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleListElementModelCopyWith<$Res> {
  factory $ScheduleListElementModelCopyWith(ScheduleListElementModel value,
          $Res Function(ScheduleListElementModel) then) =
      _$ScheduleListElementModelCopyWithImpl<$Res>;
  $Res call(
      {int scheduleId,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      List<String> dateTimeTexts,
      String scheduleTitle});
}

/// @nodoc
class _$ScheduleListElementModelCopyWithImpl<$Res>
    implements $ScheduleListElementModelCopyWith<$Res> {
  _$ScheduleListElementModelCopyWithImpl(this._value, this._then);

  final ScheduleListElementModel _value;
  // ignore: unused_field
  final $Res Function(ScheduleListElementModel) _then;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? dateTimeTexts = freezed,
    Object? scheduleTitle = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      isWholeDay: isWholeDay == freezed
          ? _value.isWholeDay
          : isWholeDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateTimeTexts: dateTimeTexts == freezed
          ? _value.dateTimeTexts
          : dateTimeTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scheduleTitle: scheduleTitle == freezed
          ? _value.scheduleTitle
          : scheduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleListElementModelCopyWith<$Res>
    implements $ScheduleListElementModelCopyWith<$Res> {
  factory _$ScheduleListElementModelCopyWith(_ScheduleListElementModel value,
          $Res Function(_ScheduleListElementModel) then) =
      __$ScheduleListElementModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int scheduleId,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      List<String> dateTimeTexts,
      String scheduleTitle});
}

/// @nodoc
class __$ScheduleListElementModelCopyWithImpl<$Res>
    extends _$ScheduleListElementModelCopyWithImpl<$Res>
    implements _$ScheduleListElementModelCopyWith<$Res> {
  __$ScheduleListElementModelCopyWithImpl(_ScheduleListElementModel _value,
      $Res Function(_ScheduleListElementModel) _then)
      : super(_value, (v) => _then(v as _ScheduleListElementModel));

  @override
  _ScheduleListElementModel get _value =>
      super._value as _ScheduleListElementModel;

  @override
  $Res call({
    Object? scheduleId = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? dateTimeTexts = freezed,
    Object? scheduleTitle = freezed,
  }) {
    return _then(_ScheduleListElementModel(
      scheduleId: scheduleId == freezed
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int,
      isWholeDay: isWholeDay == freezed
          ? _value.isWholeDay
          : isWholeDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateTimeTexts: dateTimeTexts == freezed
          ? _value.dateTimeTexts
          : dateTimeTexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scheduleTitle: scheduleTitle == freezed
          ? _value.scheduleTitle
          : scheduleTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ScheduleListElementModel implements _ScheduleListElementModel {
  const _$_ScheduleListElementModel(
      {required this.scheduleId,
      required this.isWholeDay,
      required this.startDateTime,
      required this.endDateTime,
      required final List<String> dateTimeTexts,
      required this.scheduleTitle})
      : _dateTimeTexts = dateTimeTexts;

  @override
  final int scheduleId;
  @override
  final bool isWholeDay;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  final List<String> _dateTimeTexts;
  @override
  List<String> get dateTimeTexts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dateTimeTexts);
  }

  @override
  final String scheduleTitle;

  @override
  String toString() {
    return 'ScheduleListElementModel(scheduleId: $scheduleId, isWholeDay: $isWholeDay, startDateTime: $startDateTime, endDateTime: $endDateTime, dateTimeTexts: $dateTimeTexts, scheduleTitle: $scheduleTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleListElementModel &&
            const DeepCollectionEquality()
                .equals(other.scheduleId, scheduleId) &&
            const DeepCollectionEquality()
                .equals(other.isWholeDay, isWholeDay) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality()
                .equals(other.endDateTime, endDateTime) &&
            const DeepCollectionEquality()
                .equals(other.dateTimeTexts, dateTimeTexts) &&
            const DeepCollectionEquality()
                .equals(other.scheduleTitle, scheduleTitle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scheduleId),
      const DeepCollectionEquality().hash(isWholeDay),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(endDateTime),
      const DeepCollectionEquality().hash(dateTimeTexts),
      const DeepCollectionEquality().hash(scheduleTitle));

  @JsonKey(ignore: true)
  @override
  _$ScheduleListElementModelCopyWith<_ScheduleListElementModel> get copyWith =>
      __$ScheduleListElementModelCopyWithImpl<_ScheduleListElementModel>(
          this, _$identity);
}

abstract class _ScheduleListElementModel implements ScheduleListElementModel {
  const factory _ScheduleListElementModel(
      {required final int scheduleId,
      required final bool isWholeDay,
      required final DateTime startDateTime,
      required final DateTime endDateTime,
      required final List<String> dateTimeTexts,
      required final String scheduleTitle}) = _$_ScheduleListElementModel;

  @override
  int get scheduleId => throw _privateConstructorUsedError;
  @override
  bool get isWholeDay => throw _privateConstructorUsedError;
  @override
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @override
  DateTime get endDateTime => throw _privateConstructorUsedError;
  @override
  List<String> get dateTimeTexts => throw _privateConstructorUsedError;
  @override
  String get scheduleTitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleListElementModelCopyWith<_ScheduleListElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}
