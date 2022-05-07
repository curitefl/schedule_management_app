// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_list_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleListViewModel {
  DateTime? get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleListViewModelCopyWith<ScheduleListViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleListViewModelCopyWith<$Res> {
  factory $ScheduleListViewModelCopyWith(ScheduleListViewModel value,
          $Res Function(ScheduleListViewModel) then) =
      _$ScheduleListViewModelCopyWithImpl<$Res>;
  $Res call({DateTime? dateTime});
}

/// @nodoc
class _$ScheduleListViewModelCopyWithImpl<$Res>
    implements $ScheduleListViewModelCopyWith<$Res> {
  _$ScheduleListViewModelCopyWithImpl(this._value, this._then);

  final ScheduleListViewModel _value;
  // ignore: unused_field
  final $Res Function(ScheduleListViewModel) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleListViewModelCopyWith<$Res>
    implements $ScheduleListViewModelCopyWith<$Res> {
  factory _$ScheduleListViewModelCopyWith(_ScheduleListViewModel value,
          $Res Function(_ScheduleListViewModel) then) =
      __$ScheduleListViewModelCopyWithImpl<$Res>;
  @override
  $Res call({DateTime? dateTime});
}

/// @nodoc
class __$ScheduleListViewModelCopyWithImpl<$Res>
    extends _$ScheduleListViewModelCopyWithImpl<$Res>
    implements _$ScheduleListViewModelCopyWith<$Res> {
  __$ScheduleListViewModelCopyWithImpl(_ScheduleListViewModel _value,
      $Res Function(_ScheduleListViewModel) _then)
      : super(_value, (v) => _then(v as _ScheduleListViewModel));

  @override
  _ScheduleListViewModel get _value => super._value as _ScheduleListViewModel;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_ScheduleListViewModel(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_ScheduleListViewModel
    with DiagnosticableTreeMixin
    implements _ScheduleListViewModel {
  const _$_ScheduleListViewModel({this.dateTime});

  @override
  final DateTime? dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScheduleListViewModel(dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScheduleListViewModel'))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleListViewModel &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$ScheduleListViewModelCopyWith<_ScheduleListViewModel> get copyWith =>
      __$ScheduleListViewModelCopyWithImpl<_ScheduleListViewModel>(
          this, _$identity);
}

abstract class _ScheduleListViewModel implements ScheduleListViewModel {
  const factory _ScheduleListViewModel({final DateTime? dateTime}) =
      _$_ScheduleListViewModel;

  @override
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleListViewModelCopyWith<_ScheduleListViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
