import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi/model/bmi_data.dart';
import 'package:bmi/utils/mock_data.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../model/gender.dart';

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
    double resultBMI = event.weight / pow(event.height / 100, 2);
    if (event.age <= 19) {
      if (event.gender == Gender.MALE) {
        for (var bmi in bmiMales) {
          if (bmi.age == event.age) {
            emit(CalculationBMISuccess(bmiData: bmi, bmi: resultBMI));
            print('TheMD MALE ${bmi.toString()}');
          }
        }
      } else {
        for (var bmi in bmiFeMales) {
          if (bmi.age == event.age) {
            emit(CalculationBMISuccess(bmiData: bmi, bmi: resultBMI));
            print('TheMD FEMALE ${bmi.toString()}');
          }
        }
      }
    } else if (event.age > 20) {
      emit(CalculationBMISuccess(bmiData: defaultBMI, bmi: resultBMI));
      print('TheMD Defaul$defaultBMI');
    }
    print('TheMD $resultBMI');
  }
}
