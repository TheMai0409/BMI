import 'package:bmi/di/injection.config.dart';
import 'package:bmi/screen/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureCoreDependencies() async {
  getIt.init();
}
