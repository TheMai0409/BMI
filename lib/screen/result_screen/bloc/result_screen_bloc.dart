import 'package:bloc/bloc.dart';
import 'package:bmi/manager/hive_manager.dart';
import 'package:bmi/model/user_bmi.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'result_screen_event.dart';

part 'result_screen_state.dart';

@injectable
class ResultScreenBloc extends Bloc<ResultScreenEvent, ResultScreenState> {
  ResultScreenBloc() : super(ResultScreenInitial()) {
    on<SaveDataBMI>(_mapSaveDataBMI);
  }

  void _mapSaveDataBMI(SaveDataBMI event, Emitter<ResultScreenState> emit) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print('TheMD $formattedDate');
    UserBMI userBMI = UserBMI(
      dateTime: formattedDate,
      bmi: event.bmi,
      age: event.age,
      gender: event.gender,
    );

    List<UserBMI> listBMI = [];
    listBMI = getListBMI();
    listBMI.add(userBMI);

    saveListBMI(users: listBMI);

    List<UserBMI> listBMIs = getListBMI();
    print('TheMD $listBMIs');

    emit(SaveDataSuccess());
  }
}
