part of 'history_screen_bloc.dart';

@immutable
abstract class HistoryScreenState {}

class HistoryScreenInitial extends HistoryScreenState {}

class DeleteSuccess extends HistoryScreenState {
  final List<UserBMI> lists;

  DeleteSuccess({required this.lists});
}

class OnSelectItem extends HistoryScreenState {
  final BMIData data;
  final UserBMI userBMI;

  OnSelectItem({required this.data, required this.userBMI});
}
