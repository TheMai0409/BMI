part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class TabChanged extends MainScreenState {
  final int tabIndex;

  TabChanged({required this.tabIndex});
}

class TabChangedViewPage extends MainScreenState {
  final int tabIndex;

  TabChangedViewPage({required this.tabIndex});
}
