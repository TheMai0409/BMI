import 'package:bmi/screen/main/bloc/language_bloc.dart';
import 'package:bmi/screen/main_screen/screen/main_screen.dart';
import 'package:bmi/screen/result_screen/result_screen.dart';
import 'package:bmi/screen/setting_screen/setting_screen.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../manager/hive_manager.dart';
import '../../utils/routes.dart';
import '../splash_screen/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureCoreDependencies();
  await openBox();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageBloc>(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: NavigationService.navigationKey,
          initialRoute: RouteConstants.root,
          routes: {
            RouteConstants.root: (_) => const SplashScreen(),
            RouteConstants.settingScreen: (_) => const SettingScreen(),
            RouteConstants.mainScreen: (_) => const MainScreen(),
            RouteConstants.resultScreen: (_) => const ResultScreen(),
          },
        );
      },
    );
  }
}
