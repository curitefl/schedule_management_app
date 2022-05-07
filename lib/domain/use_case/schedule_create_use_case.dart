import 'dart:collection';
import 'dart:ui';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/calandar_state.dart';
import 'package:schedule_management_app/presentation/state/schedule_create_state.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_create_view_model.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_view_model.dart';
import 'package:schedule_management_app/service/data_store/calendar_data_store.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleCreateUseCase {
  final ScheduleRepository _repository;
  final ScheduleCreateViewModel _viewModel;
  final ScheduleCreateState _scheduleCreateState;
  final CalendarState _calendarState;
  LinkedHashMap<DateTime, List<String>>? _eventHashMap;

  ScheduleCreateUseCase(
    this._repository,
    this._viewModel,
    this._scheduleCreateState,
    this._calendarState,
  );

  VoidCallback? getSaveCallback() {
    if (!_viewModel.canSave) {
      return null;
    }
    return _save;
  }

  void setTitle(String title) {
    _scheduleCreateState.setTitle(title);
  }

  void setDescription(String description) {
    _scheduleCreateState.setDescription(description);
  }

  Future refreshViewModel() async {
    _eventHashMap ??= LinkedHashMap<DateTime, List<String>>(
      equals: isSameDay,
      hashCode: _getHashCode,
    );

    var entries = await _repository.getMonthScheduleEntries(_getFocusedMonth());
    var hashMap = LinkedHashMap.fromIterables(
        entries.map((entry) => entry.startDateTime), entries.map((entry) => [entry.title]));
    _eventHashMap!.addAll(hashMap);
    await updateMonthEntries();
  }

  Future<List<Schedule>> getMonthScheduleEntries(int month) {
    // TODO Scheduleのモデルを定義する
    return _repository.getMonthScheduleEntries(month);
  }

  Future updateMonthEntries() async {
    // TODO calendar_use_case.dartと共通化する
    var entries = await getMonthScheduleEntries(_getFocusedMonth());
    var modelList = entries
        .map(
          (entry) => ScheduleViewModel(
            id: entry.id,
            title: entry.title,
            isWholeDay: entry.isWholeDay,
            startDateTime: entry.startDateTime,
            endDateTime: entry.endDateTime,
            description: entry.description,
          ),
        )
        .toList();
    _calendarState.updateScheduleViewModel(modelList);
  }

  Future updateSchedule(
    int id,
    String title,
    bool isWholeDay,
    DateTime startDateTime,
    DateTime endDateTime,
    String description,
  ) async {
    await _repository.updateSchedule(
        id, title, isWholeDay, startDateTime, endDateTime, description);
    await updateMonthEntries();
  }

  int _getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  int _getFocusedMonth() {
    return _viewModel.selectedDay.month;
  }

  Future _save() async {
    await _repository.addSchedule(
      _viewModel.title,
      _viewModel.isWholeDay,
      _viewModel.startDateTime,
      _viewModel.endDateTime,
      _viewModel.description,
    );

    await updateMonthEntries();
    await refreshViewModel();
  }
}
