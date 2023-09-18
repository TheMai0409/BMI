part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class OnTabChange extends MainScreenEvent {
  final int index;

  OnTabChange({required this.index});
}
