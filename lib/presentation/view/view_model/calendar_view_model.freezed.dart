// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarViewModel {
  DateTime get focusedDay => throw _privateConstructorUsedError;
  DateTime get currentDay => throw _privateConstructorUsedError;
  List<ScheduleViewModel> get scheduleViewModelList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarViewModelCopyWith<CalendarViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarViewModelCopyWith<$Res> {
  factory $CalendarViewModelCopyWith(
          CalendarViewModel value, $Res Function(CalendarViewModel) then) =
      _$CalendarViewModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime focusedDay,
      DateTime currentDay,
      List<ScheduleViewModel> scheduleViewModelList});
}

/// @nodoc
class _$CalendarViewModelCopyWithImpl<$Res>
    implements $CalendarViewModelCopyWith<$Res> {
  _$CalendarViewModelCopyWithImpl(this._value, this._then);

  final CalendarViewModel _value;
  // ignore: unused_field
  final $Res Function(CalendarViewModel) _then;

  @override
  $Res call({
    Object? focusedDay = freezed,
    Object? currentDay = freezed,
    Object? scheduleViewModelList = freezed,
  }) {
    return _then(_value.copyWith(
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDay: currentDay == freezed
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleViewModelList: scheduleViewModelList == freezed
          ? _value.scheduleViewModelList
          : scheduleViewModelList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleViewModel>,
    ));
  }
}

/// @nodoc
abstract class _$CalendarViewModelCopyWith<$Res>
    implements $CalendarViewModelCopyWith<$Res> {
  factory _$CalendarViewModelCopyWith(
          _CalendarViewModel value, $Res Function(_CalendarViewModel) then) =
      __$CalendarViewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime focusedDay,
      DateTime currentDay,
      List<ScheduleViewModel> scheduleViewModelList});
}

/// @nodoc
class __$CalendarViewModelCopyWithImpl<$Res>
    extends _$CalendarViewModelCopyWithImpl<$Res>
    implements _$CalendarViewModelCopyWith<$Res> {
  __$CalendarViewModelCopyWithImpl(
      _CalendarViewModel _value, $Res Function(_CalendarViewModel) _then)
      : super(_value, (v) => _then(v as _CalendarViewModel));

  @override
  _CalendarViewModel get _value => super._value as _CalendarViewModel;

  @override
  $Res call({
    Object? focusedDay = freezed,
    Object? currentDay = freezed,
    Object? scheduleViewModelList = freezed,
  }) {
    return _then(_CalendarViewModel(
      focusedDay: focusedDay == freezed
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currentDay: currentDay == freezed
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduleViewModelList: scheduleViewModelList == freezed
          ? _value.scheduleViewModelList
          : scheduleViewModelList // ignore: cast_nullable_to_non_nullable
              as List<ScheduleViewModel>,
    ));
  }
}

/// @nodoc

class _$_CalendarViewModel
    with DiagnosticableTreeMixin
    implements _CalendarViewModel {
  const _$_CalendarViewModel(
      {required this.focusedDay,
      required this.currentDay,
      required final List<ScheduleViewModel> scheduleViewModelList})
      : _scheduleViewModelList = scheduleViewModelList;

  @override
  final DateTime focusedDay;
  @override
  final DateTime currentDay;
  final List<ScheduleViewModel> _scheduleViewModelList;
  @override
  List<ScheduleViewModel> get scheduleViewModelList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleViewModelList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarViewModel(focusedDay: $focusedDay, currentDay: $currentDay, scheduleViewModelList: $scheduleViewModelList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarViewModel'))
      ..add(DiagnosticsProperty('focusedDay', focusedDay))
      ..add(DiagnosticsProperty('currentDay', currentDay))
      ..add(
          DiagnosticsProperty('scheduleViewModelList', scheduleViewModelList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalendarViewModel &&
            const DeepCollectionEquality()
                .equals(other.focusedDay, focusedDay) &&
            const DeepCollectionEquality()
                .equals(other.currentDay, currentDay) &&
            const DeepCollectionEquality()
                .equals(other.scheduleViewModelList, scheduleViewModelList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusedDay),
      const DeepCollectionEquality().hash(currentDay),
      const DeepCollectionEquality().hash(scheduleViewModelList));

  @JsonKey(ignore: true)
  @override
  _$CalendarViewModelCopyWith<_CalendarViewModel> get copyWith =>
      __$CalendarViewModelCopyWithImpl<_CalendarViewModel>(this, _$identity);
}

abstract class _CalendarViewModel implements CalendarViewModel {
  const factory _CalendarViewModel(
          {required final DateTime focusedDay,
          required final DateTime currentDay,
          required final List<ScheduleViewModel> scheduleViewModelList}) =
      _$_CalendarViewModel;

  @override
  DateTime get focusedDay => throw _privateConstructorUsedError;
  @override
  DateTime get currentDay => throw _privateConstructorUsedError;
  @override
  List<ScheduleViewModel> get scheduleViewModelList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarViewModelCopyWith<_CalendarViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
