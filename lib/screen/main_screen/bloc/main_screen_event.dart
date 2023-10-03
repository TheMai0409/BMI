part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class OnTabChange extends MainScreenEvent {
  final int index;

  OnTabChange({required this.index});
}

class OnScrollViewPage extends MainScreenEvent {
  final int index;

  OnScrollViewPage({required this.index});
}

class ShowRate extends MainScreenEvent {
  final RateMyApp rateMyApp;

  ShowRate(this.rateMyApp);
}
