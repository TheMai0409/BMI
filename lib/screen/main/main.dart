import 'package:bmi/screen/main/bloc/language_bloc.dart';
import 'package:bmi/screen/main_screen/screen/main_screen.dart';
import 'package:bmi/screen/result_screen/result_screen.dart';
import 'package:bmi/screen/setting_screen/setting_screen.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:flutter_localizations/flutter_localizations.dart";

import '../../di/injection.dart';
import '../../manager/hive_manager.dart';
import '../../utils/routes.dart';
import '../splash/screen/splash_screen.dart';

void main() async {
  await configureCoreDependencies();
  await openBox();
  runApp(const MyApp());
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
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          locale: (state is ChangeLocalState)
              ? Locale(state.locale)
              : const Locale('vi'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
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
