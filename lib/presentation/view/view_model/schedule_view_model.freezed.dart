// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleViewModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isWholeDay => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get endDateTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleViewModelCopyWith<ScheduleViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleViewModelCopyWith<$Res> {
  factory $ScheduleViewModelCopyWith(
          ScheduleViewModel value, $Res Function(ScheduleViewModel) then) =
      _$ScheduleViewModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description});
}

/// @nodoc
class _$ScheduleViewModelCopyWithImpl<$Res>
    implements $ScheduleViewModelCopyWith<$Res> {
  _$ScheduleViewModelCopyWithImpl(this._value, this._then);

  final ScheduleViewModel _value;
  // ignore: unused_field
  final $Res Function(ScheduleViewModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleViewModelCopyWith<$Res>
    implements $ScheduleViewModelCopyWith<$Res> {
  factory _$ScheduleViewModelCopyWith(
          _ScheduleViewModel value, $Res Function(_ScheduleViewModel) then) =
      __$ScheduleViewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description});
}

/// @nodoc
class __$ScheduleViewModelCopyWithImpl<$Res>
    extends _$ScheduleViewModelCopyWithImpl<$Res>
    implements _$ScheduleViewModelCopyWith<$Res> {
  __$ScheduleViewModelCopyWithImpl(
      _ScheduleViewModel _value, $Res Function(_ScheduleViewModel) _then)
      : super(_value, (v) => _then(v as _ScheduleViewModel));

  @override
  _ScheduleViewModel get _value => super._value as _ScheduleViewModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? description = freezed,
  }) {
    return _then(_ScheduleViewModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ScheduleViewModel implements _ScheduleViewModel {
  const _$_ScheduleViewModel(
      {required this.id,
      required this.title,
      required this.isWholeDay,
      required this.startDateTime,
      required this.endDateTime,
      required this.description});

  @override
  final int id;
  @override
  final String title;
  @override
  final bool isWholeDay;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final String description;

  @override
  String toString() {
    return 'ScheduleViewModel(id: $id, title: $title, isWholeDay: $isWholeDay, startDateTime: $startDateTime, endDateTime: $endDateTime, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleViewModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isWholeDay, isWholeDay) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality()
                .equals(other.endDateTime, endDateTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isWholeDay),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(endDateTime),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$ScheduleViewModelCopyWith<_ScheduleViewModel> get copyWith =>
      __$ScheduleViewModelCopyWithImpl<_ScheduleViewModel>(this, _$identity);
}

abstract class _ScheduleViewModel implements ScheduleViewModel {
  const factory _ScheduleViewModel(
      {required final int id,
      required final String title,
      required final bool isWholeDay,
      required final DateTime startDateTime,
      required final DateTime endDateTime,
      required final String description}) = _$_ScheduleViewModel;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  bool get isWholeDay => throw _privateConstructorUsedError;
  @override
  DateTime get startDateTime => throw _privateConstructorUsedError;
  @override
  DateTime get endDateTime => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleViewModelCopyWith<_ScheduleViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
