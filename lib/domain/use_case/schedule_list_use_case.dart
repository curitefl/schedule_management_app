import 'package:intl/intl.dart';
import 'package:schedule_management_app/data/repository/schedule_repository.dart';
import 'package:schedule_management_app/presentation/state/schedule_list_state.dart';
import 'package:schedule_management_app/presentation/view/constants/schedule_list_constants.dart';
import 'package:schedule_management_app/presentation/view/constants/text_constants.dart';
import 'package:schedule_management_app/presentation/view/view_model/schedule_list_element_model.dart';

class ScheduleListUseCase {
  final ScheduleRepository _repository;
  final ScheduleListState _state;

  ScheduleListUseCase(
    final this._repository,
    final this._state,
  );

  void setSelectedDay(DateTime selectedDateTime) {
    _state.setSelectedDay(selectedDateTime);
  }

  Future reloadState() async {
    final selectedDateTime = _state.viewModel.selectedDateTime;
    final entries = await _repository.getDayScheduleEntries(selectedDateTime);

    final scheduleElements = entries
        .map((entry) => ScheduleListElementModel(
              scheduleId: entry.id,
              isWholeDay: entry.isWholeDay,
              startDateTime: entry.startDateTime,
              endDateTime: entry.endDateTime,
              dateTimeTexts: entry.isWholeDay
                  ? [TextConstants.scheduleListViewWholeDay]
                  : [
                      _getDateTimeText().format(entry.startDateTime),
                      _getDateTimeText().format(entry.endDateTime),
                    ],
              scheduleTitle: entry.title,
            ))
        .toList();

    _state.setScheduleElements(scheduleElements);
  }

  DateFormat _getDateTimeText() => DateFormat(
        TextConstants.scheduleListViewTimeFormat,
        ScheduleListConstants.scheduleListLocale,
      );
}
