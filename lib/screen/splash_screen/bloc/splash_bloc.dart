import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';
@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<GoToMainScreen>(_goToMainEvent);
  }

  void _goToMainEvent(SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashInitial());
    await Future.delayed(const Duration(seconds: 4));
    emit(GoToMainScreenSuccess());
  }
}
