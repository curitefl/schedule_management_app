import 'package:flutter/material.dart';
import 'package:schedule_management_app/domain/use_case/schedule_list_use_case.dart';
import 'package:schedule_management_app/presentation/view/view/schedule_create_view.dart';

class ScheduleListPresenter {
  final ScheduleListUseCase _useCase;

  ScheduleListPresenter(final this._useCase);

  void showScheduleCreateView(final BuildContext context, final DateTime selectedDay) {
    _useCase.setSelectedDay(selectedDay);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const ScheduleCreateView();
        },
      ),
    );
  }
}
