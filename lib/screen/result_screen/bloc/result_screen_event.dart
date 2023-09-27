part of 'result_screen_bloc.dart';

@immutable
abstract class ResultScreenEvent {}

class SaveDataBMI extends ResultScreenEvent {
  final double bmi;
  final int age, gender;

  SaveDataBMI({
    required this.bmi,
    required this.age,
    required this.gender,
  });
}
