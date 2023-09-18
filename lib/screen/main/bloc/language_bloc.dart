import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'language_event.dart';

part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguage>(_onChangeLange);
  }

  void _onChangeLange(ChangeLanguage event, Emitter<LanguageState> emit) {
    emit(ChangeLocalState(locale: event.locale));
  }
}
