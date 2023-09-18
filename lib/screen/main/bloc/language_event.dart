part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String locale;

  ChangeLanguage({required this.locale});
}
