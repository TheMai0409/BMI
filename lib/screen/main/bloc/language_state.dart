part of 'language_bloc.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class ChangeLocalState extends LanguageState {
  final String locale;

  ChangeLocalState({required this.locale});
}
