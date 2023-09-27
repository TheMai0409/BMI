// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bmi/screen/home_screen/bloc/home_screen_bloc.dart' as _i3;
import 'package:bmi/screen/main/bloc/language_bloc.dart' as _i4;
import 'package:bmi/screen/main_screen/bloc/main_screen_bloc.dart' as _i5;
import 'package:bmi/screen/result_screen/bloc/result_screen_bloc.dart' as _i6;
import 'package:bmi/screen/splash_screen/bloc/splash_bloc.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeScreenBloc>(() => _i3.HomeScreenBloc());
    gh.factory<_i4.LanguageBloc>(() => _i4.LanguageBloc());
    gh.factory<_i5.MainScreenBloc>(() => _i5.MainScreenBloc());
    gh.factory<_i6.ResultScreenBloc>(() => _i6.ResultScreenBloc());
    gh.factory<_i7.SplashBloc>(() => _i7.SplashBloc());
    return this;
  }
}
