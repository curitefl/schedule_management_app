// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_create_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleCreateViewModel {
  String get title => throw _privateConstructorUsedError;
  bool get isWholeDay => throw _privateConstructorUsedError;
  DateTime get startDateTime => throw _privateConstructorUsedError;
  DateTime get endDateTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get canSave => throw _privateConstructorUsedError;
  bool get isModified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleCreateViewModelCopyWith<ScheduleCreateViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCreateViewModelCopyWith<$Res> {
  factory $ScheduleCreateViewModelCopyWith(ScheduleCreateViewModel value,
          $Res Function(ScheduleCreateViewModel) then) =
      _$ScheduleCreateViewModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description,
      bool canSave,
      bool isModified});
}

/// @nodoc
class _$ScheduleCreateViewModelCopyWithImpl<$Res>
    implements $ScheduleCreateViewModelCopyWith<$Res> {
  _$ScheduleCreateViewModelCopyWithImpl(this._value, this._then);

  final ScheduleCreateViewModel _value;
  // ignore: unused_field
  final $Res Function(ScheduleCreateViewModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? description = freezed,
    Object? canSave = freezed,
    Object? isModified = freezed,
  }) {
    return _then(_value.copyWith(
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
      canSave: canSave == freezed
          ? _value.canSave
          : canSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isModified: isModified == freezed
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleCreateViewModelCopyWith<$Res>
    implements $ScheduleCreateViewModelCopyWith<$Res> {
  factory _$ScheduleCreateViewModelCopyWith(_ScheduleCreateViewModel value,
          $Res Function(_ScheduleCreateViewModel) then) =
      __$ScheduleCreateViewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      bool isWholeDay,
      DateTime startDateTime,
      DateTime endDateTime,
      String description,
      bool canSave,
      bool isModified});
}

/// @nodoc
class __$ScheduleCreateViewModelCopyWithImpl<$Res>
    extends _$ScheduleCreateViewModelCopyWithImpl<$Res>
    implements _$ScheduleCreateViewModelCopyWith<$Res> {
  __$ScheduleCreateViewModelCopyWithImpl(_ScheduleCreateViewModel _value,
      $Res Function(_ScheduleCreateViewModel) _then)
      : super(_value, (v) => _then(v as _ScheduleCreateViewModel));

  @override
  _ScheduleCreateViewModel get _value =>
      super._value as _ScheduleCreateViewModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? isWholeDay = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
    Object? description = freezed,
    Object? canSave = freezed,
    Object? isModified = freezed,
  }) {
    return _then(_ScheduleCreateViewModel(
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
      canSave: canSave == freezed
          ? _value.canSave
          : canSave // ignore: cast_nullable_to_non_nullable
              as bool,
      isModified: isModified == freezed
          ? _value.isModified
          : isModified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ScheduleCreateViewModel implements _ScheduleCreateViewModel {
  const _$_ScheduleCreateViewModel(
      {required this.title,
      required this.isWholeDay,
      required this.startDateTime,
      required this.endDateTime,
      required this.description,
      required this.canSave,
      required this.isModified});

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
  final bool canSave;
  @override
  final bool isModified;

  @override
  String toString() {
    return 'ScheduleCreateViewModel(title: $title, isWholeDay: $isWholeDay, startDateTime: $startDateTime, endDateTime: $endDateTime, description: $description, canSave: $canSave, isModified: $isModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleCreateViewModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isWholeDay, isWholeDay) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality()
                .equals(other.endDateTime, endDateTime) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.canSave, canSave) &&
            const DeepCollectionEquality()
                .equals(other.isModified, isModified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isWholeDay),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(endDateTime),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(canSave),
      const DeepCollectionEquality().hash(isModified));

  @JsonKey(ignore: true)
  @override
  _$ScheduleCreateViewModelCopyWith<_ScheduleCreateViewModel> get copyWith =>
      __$ScheduleCreateViewModelCopyWithImpl<_ScheduleCreateViewModel>(
          this, _$identity);
}

abstract class _ScheduleCreateViewModel implements ScheduleCreateViewModel {
  const factory _ScheduleCreateViewModel(
      {required final String title,
      required final bool isWholeDay,
      required final DateTime startDateTime,
      required final DateTime endDateTime,
      required final String description,
      required final bool canSave,
      required final bool isModified}) = _$_ScheduleCreateViewModel;

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
  bool get canSave => throw _privateConstructorUsedError;
  @override
  bool get isModified => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleCreateViewModelCopyWith<_ScheduleCreateViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
