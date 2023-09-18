import 'package:bmi/screen/main/bloc/language_bloc.dart';
import 'package:bmi/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:flutter_localizations/flutter_localizations.dart"
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;

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
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is ChangeLocalState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: const [
              Locale('en'),
              Locale('vi'),
            ],
            locale: Locale(state.locale),
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
            },
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          locale: const Locale('vi'),
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
          },
        );
      },
    );
  }
}
