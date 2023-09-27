import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi/model/bmi_data.dart';
import 'package:bmi/utils/mock_data.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'home_screen_event.dart';
part 'home_screen_state.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<OnTapGender>(_mapTapGender);
    on<OnSwipeAge>(_mapSwipeAge);
    on<CalculationBMI>(_mapCalculationBMI);
  }

  void _mapTapGender(OnTapGender event, Emitter<HomeScreenState> emit) {
    emit(SelectGender(gender: event.gender));
  }

  void _mapSwipeAge(OnSwipeAge event, Emitter<HomeScreenState> emit) {
    emit(SwipeAgeSuccess(age: event.age));
  }

  void _mapCalculationBMI(CalculationBMI event, Emitter<HomeScreenState> emit) {
    double? weight = double.tryParse(event.weight);
    double? height = double.tryParse(event.height);
    if (height == null && weight != null) {
      emit(HeightValidate());
      return;
    }

    if (height != null && weight == null) {
      emit(WeightValidate());
      return;
    }
    if (height != null && weight != null) {
      if (height == 0.0 && weight == 0.0) {

        emit(WeightAndHeightValidate());
        return;
      }
      if (height == 0.0 && weight != 0.0) {
        emit(HeightValidate());
        return;
      }
      if (height != 0.0 && weight == 0.0) {
        emit(WeightValidate());
        return;
      }
      double resultBMI = weight / pow(height / 100, 2);
      if (event.age <= 19) {
        if (event.gender == MALE) {
          for (var bmi in bmiMales) {
            if (bmi.age == event.age) {

              emit(CalculationBMISuccess(bmiData: bmi, bmi: resultBMI));

            }
          }
        } else {
          for (var bmi in bmiFeMales) {
            if (bmi.age == event.age) {
              emit(CalculationBMISuccess(bmiData: bmi, bmi: resultBMI));

            }
          }
        }
      } else if (event.age > 20) {
        emit(CalculationBMISuccess(bmiData: defaultBMI, bmi: resultBMI));

      }

    }
  }
}
