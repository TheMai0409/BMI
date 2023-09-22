import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@injectable
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<OnTabChange>(_onTabChange);
    on<OnScrollViewPage>(_onScrollViewPage);
  }

  void _onTabChange(OnTabChange event, Emitter<MainScreenState> emit) {
    emit(MainScreenInitial());
    emit(TabChanged(tabIndex: event.index));
  }

  void _onScrollViewPage(
      OnScrollViewPage event, Emitter<MainScreenState> emit) {
    emit(MainScreenInitial());
    emit(TabChangedViewPage(tabIndex: event.index));
  }
}
