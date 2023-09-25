part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class OnTapGender extends HomeScreenEvent {
  final int gender;

  OnTapGender({required this.gender});
}

class OnSwipeAge extends HomeScreenEvent {
  final int age;

  OnSwipeAge({required this.age});
}
