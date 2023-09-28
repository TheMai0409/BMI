part of 'history_screen_bloc.dart';

@immutable
abstract class HistoryScreenEvent {}

class SelectBMI extends HistoryScreenEvent {
  final UserBMI data;

  SelectBMI({required this.data});
}

class RemoveItemBMI extends HistoryScreenEvent {
  final UserBMI data;
  final List<UserBMI> lists;

  RemoveItemBMI({required this.lists, required this.data});
}
