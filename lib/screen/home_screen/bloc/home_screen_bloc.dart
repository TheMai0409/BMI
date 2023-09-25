import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';
@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<OnTapGender>(_mapTapGender);
    on<OnSwipeAge>(_mapSwipeAge);
  }

  void _mapTapGender(OnTapGender event, Emitter<HomeScreenState> emit) {
    emit(SelectGender(gender: event.gender));
  }

  void _mapSwipeAge(OnSwipeAge event, Emitter<HomeScreenState> emit) {
    emit(SwipeAgeSuccess(age: event.age));
  }
}
