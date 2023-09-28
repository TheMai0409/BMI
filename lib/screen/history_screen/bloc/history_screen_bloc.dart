import 'package:bloc/bloc.dart';
import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/model/bmi_data.dart';
import 'package:bmi/model/user_bmi.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../utils/mock_data.dart';

part 'history_screen_event.dart';

part 'history_screen_state.dart';

@injectable
class HistoryScreenBloc extends Bloc<HistoryScreenEvent, HistoryScreenState> {
  HistoryScreenBloc() : super(HistoryScreenInitial()) {
    on<SelectBMI>(_mapSelectBMI);
    on<RemoveItemBMI>(_mapRemoveItemBMI);
  }

  void _mapSelectBMI(SelectBMI event, Emitter<HistoryScreenState> emit) {
    if (event.data.age! <= 19) {
      if (event.data.gender == MALE) {
        for (var bmi in bmiMales) {
          if (bmi.age == event.data.age!) {
            emit(OnSelectItem(
              data: bmi,
              userBMI: event.data,
            ));
          }
        }
      } else {
        for (var bmi in bmiFeMales) {
          if (bmi.age == event.data.age!) {
            emit(OnSelectItem(
              data: bmi,
              userBMI: event.data,
            ));
          }
        }
      }
    } else if (event.data.age! > 20) {
      emit(OnSelectItem(
        data: defaultBMI,
        userBMI: event.data,
      ));
    }
  }

  void _mapRemoveItemBMI(
      RemoveItemBMI event, Emitter<HistoryScreenState> emit) {
    event.lists.remove(event.data);
    saveListBMI(users: event.lists);
    emit(DeleteSuccess(lists: event.lists));
  }
}
