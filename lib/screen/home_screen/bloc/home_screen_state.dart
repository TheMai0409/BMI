part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class SelectGender extends HomeScreenState {
  final int gender;

  SelectGender({required this.gender});
}

class SwipeAgeSuccess extends HomeScreenState {
  final int age;

  SwipeAgeSuccess({required this.age});
}

class CalculationBMISuccess extends HomeScreenState {
  final BMIData bmiData;
  final double bmi;

  CalculationBMISuccess({
    required this.bmiData,
    required this.bmi,
  });
}
